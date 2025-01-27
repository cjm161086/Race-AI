/// General drawing configuration
var header_color = c_white; // Header color
var text_color = c_ltgray;  // Value color
var cell_width = 100;       // Width of each cell
var cell_height = 20;       // Height of each cell

/// Draw vehicle headers
draw_set_color(header_color);
draw_text(50, 400, "Instance");
draw_text(300, 400, "Direction");
draw_text(400, 400, "Category");
draw_text(500, 400, "Epsilon");
draw_text(600, 400, "Eps decay");
draw_text(700, 400, "Eps min");
draw_text(800, 400, "Reward");
draw_text(900, 400, "Intent");
draw_text(1000, 400, "Lifetime");

/// Draw vehicle information
var vehicle_y = 420; // Initial line
with (obj_car) {
    draw_set_color(text_color);
    draw_text(50, vehicle_y, string(id));
    draw_text(300, vehicle_y, string(direction));
    draw_text(400, vehicle_y, string(category));
    draw_text(500, vehicle_y, string_format(epsilon, 0, 2)); // Format epsilon
	draw_text(600, vehicle_y, string(epsilon_decay));
	draw_text(700, vehicle_y, string(epsilon_min));
    draw_text(800, vehicle_y, string(instance_reward));
    draw_text(900, vehicle_y, string(intent));
	draw_text(1000, vehicle_y, string(lifetime));
    vehicle_y += cell_height; // Increment line
}

/// Draw Q-table headers
draw_set_color(header_color);
draw_text(830, 30, "F-L-R"); // Sensors
draw_text(930, 30, "Left");
draw_text(1030, 30, "Right");
draw_text(1130, 30, "Nothing");

/// Draw Q-table states
var start_x = 930; // Initial X position for the Q-table
var start_y = 50; // Initial Y position
if (global.q_table != undefined) {
    for (var row = 0; row < ds_grid_width(global.q_table); row++) {
        // Draw the state (F-L-R) for each row
        var state_string = "";
        if (row & 4) state_string += "1-"; else state_string += "0-";
        if (row & 2) state_string += "1-"; else state_string += "0-";
        if (row & 1) state_string += "1"; else state_string += "0";
        draw_set_color(header_color);
        draw_text(830, start_y + row * cell_height, state_string); // Draw the state

        // Draw action values in each column
        for (var col = 0; col < ds_grid_height(global.q_table); col++) {
            var value = ds_grid_get(global.q_table, row, col);
            var draw_x = start_x + col * cell_width;
            var draw_y = start_y + row * cell_height;
            draw_set_color(text_color);
            draw_text(draw_x, draw_y, string_format(value, 0, 2)); // Format values
        }
    }
}

draw_set_color(c_green);
draw_text(50, 600, "Best lifetime: " + string(global.best_lifetime) + " (" + string(global.best_lifetime/room_speed) + " seconds)");
draw_text(50, 620, "Best instance: " + string(global.best_instance));
draw_text(50, 640, "Best intent: " + string(global.best_intent));
draw_set_color(header_color);

//Initial config
draw_set_color(header_color);
draw_text(830, 250, "Initial config");
draw_set_color(text_color);
draw_text(830, 270, "Vehicles: " + string(global.num_vehicles));
draw_text(830, 290, "Learning rate (Alpha): " + string(global.alpha));
draw_text(830, 310, "Discount factor (Gamma): " + string(global.gamma));

