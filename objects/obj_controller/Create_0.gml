// Q-table parameters
var n_sensors = 8; // Possible combinations of sensors (2^3)
var n_actions = 3; // Actions: turn left, turn right, go straight

// Create the Q-table
global.q_table = ds_grid_create(n_sensors, n_actions);

// Initialize all Q(s, a) values to 0
ds_grid_clear(global.q_table, 0);

// Save global parameters for reference
global.n_sensors = n_sensors;
global.n_actions = n_actions;

// Learning parameters
global.alpha = 0.2; // Learning rate
global.gamma = 0.99; // Discount factor

// Create multiple vehicles
global.num_vehicles = 3; // Number of configurable vehicles
global.start_x = 192;
global.start_y = 64;
for (var i = 0; i < global.num_vehicles; i++) {
    // var x_position = 192 + (i * 30); // Space vehicles horizontally
    instance_create_layer(global.start_x, global.start_y, "Cars", obj_car);
}

global.best_lifetime = 0;
global.best_instance = 0;
global.best_intent = 0;
