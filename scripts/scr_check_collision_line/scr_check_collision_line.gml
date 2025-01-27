
function check_collision_line(car_x, car_y, sensor_x, sensor_y) 
{
	var collision = collision_line(car_x, car_y, sensor_x, sensor_y, obj_collision, true, true);
	if(collision != noone) return 1;
	else return 0;
}