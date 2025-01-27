
function get_state_index(_collision_front, _collision_left, _collision_right) 
{
	/// Get actual index
	return (_collision_front * 4) + (_collision_left * 2) + (_collision_right * 1);
}