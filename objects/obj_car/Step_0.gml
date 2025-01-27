/// Step Event of obj_car

/// Initial coordinates of the vehicle
var car_x = x;
var car_y = y;

/// Vehicle's angle
var car_direction = direction;

/// Update the sprite's angle
image_angle = car_direction;

/// Calculate sensor positions
// Front sensor (0°)
sensor_front_x = car_x + lengthdir_x(sensor_length, car_direction);
sensor_front_y = car_y + lengthdir_y(sensor_length, car_direction);

// Left sensor (+45°)
sensor_left_x = car_x + lengthdir_x(sensor_length, car_direction + sensor_angle);
sensor_left_y = car_y + lengthdir_y(sensor_length, car_direction + sensor_angle);

// Right sensor (-45°)
sensor_right_x = car_x + lengthdir_x(sensor_length, car_direction - sensor_angle);
sensor_right_y = car_y + lengthdir_y(sensor_length, car_direction - sensor_angle);

/// Detect collisions (proximity)
collision_front = check_collision_line(car_x, car_y, sensor_front_x, sensor_front_y);
collision_right = check_collision_line(car_x, car_y, sensor_right_x, sensor_right_y);
collision_left = check_collision_line(car_x, car_y, sensor_left_x, sensor_left_y);

/// Get the current state
var state_index = get_state_index(collision_front, collision_left, collision_right);

/// Select an action using epsilon-greedy
var action_index = epsilon_greedy(self, state_index);

/// Execute the selected action
switch (action_index) {
    case 0: // Turn left
        direction += 8;
        break;
    case 1: // Turn right
        direction -= 8;
        break;
    case 2: // Move straight
        // No changes to direction
        break;
}

/// Calculate reward
var reward = 0;

// Increment lifetime
lifetime++;

// Penalty for collision
if (place_meeting(x, y, obj_collision)) {
    reward = -50;
    x = global.start_x; y = global.start_y; direction = 0;
    epsilon = max(epsilon * epsilon_decay, epsilon_min); // Reduce epsilon
    intent++;
	lifetime = 0; // Reset lifetime on collision
    exit;
}

if (collision_front) {
    reward -= 20; // High penalty for front collision
}
if (collision_front && action_index == 0) { // Turn left
    reward += 30;
}
if (collision_front && action_index == 1) { // Turn right
    reward += 30;
}
if (collision_front && action_index == 2) { // Move straight
    reward -= 30;
}

if (collision_right) {
    reward -= 5; // Penalty
}
if (collision_right && action_index == 0) { // Turn left
    reward += 20; // Avoid collision
}
if (collision_right && action_index == 1) { // Turn right
    reward -= 30; // Collision
}
if (collision_right && action_index == 2) { // Move straight
    reward -= 10; // Penalty
}

if (collision_left) {
    reward -= 5; // Penalty
}
if (collision_left && action_index == 0) { // Turn left
    reward -= 30; // Collision
}
if (collision_left && action_index == 1) { // Turn right
    reward += 20; // Avoid collision
}
if (collision_left && action_index == 2) { // Move straight
    reward -= 10; // Penalty
}

if (!collision_front && !collision_right && !collision_left) reward += 1;

instance_reward = reward;

/// Calculate the new state after executing the action
var new_state = get_state_index(collision_front, collision_left, collision_right);

/// Update the Q-table
// Learning parameters
var alpha = global.alpha; // Learning rate
var gamma = global.gamma; // Discount factor

// Get the current Q(s, a) value
var current_q = ds_grid_get(global.q_table, state_index, action_index);

// Calculate the best future Q(s', a') value
var max_next_q = -99999999; // Initialize with a very low value
for (var a = 0; a < global.n_actions; a++) {
    var q_value = ds_grid_get(global.q_table, new_state, a);
    if (q_value > max_next_q) {
        max_next_q = q_value;
    }
}

// Update Q(s, a)
var new_q = current_q + alpha * (reward + (gamma * max_next_q) - current_q);
ds_grid_set(global.q_table, state_index, action_index, new_q);

// Best reward
if (lifetime > global.best_lifetime) {
    global.best_lifetime = lifetime;
    global.best_instance = id;
    global.best_intent = intent;
}


/// Update the vehicle's position
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);
