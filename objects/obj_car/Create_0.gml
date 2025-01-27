/// Initial sprite
sprite_index = spr_car;

speed = 1;
direction = 0;

category = noone;

/// Configuration variables
sensor_length = 50;    // Maximum length of the sensors
sensor_angle = 45;     // Angle of the lateral sensors

/// Variables for the sensor positions
sensor_front_x = 0;
sensor_front_y = 0;
sensor_right_x = 0;
sensor_right_y = 0;
sensor_left_x = 0;
sensor_left_y = 0;

/// Variables for collisions
collision_front = 0;
collision_right = 0;
collision_left = 0;

instance_reward = 0; // Accumulated reward for this vehicle

turn_speed = 2;      // Turn speed

epsilon = 1.0;       // Initial exploration
epsilon_min = 0.05;   // Minimum exploration
//epsilon_decay = 0.997; // Epsilon decay
epsilon_decay = 0.92; // Epsilon decay

intent = 1;
lifetime = 0;