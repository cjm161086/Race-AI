/// Handle the button click
is_clicked = true;

// Create the game controller (this starts the simulation)
instance_create_layer(0, 0, "Cars", obj_controller);

// Destroy the button to make it disappear
instance_destroy();