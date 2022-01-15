/// @description clean up gates + extra gates
//if gate_left.x > gate_right.x instance_destroy();
/// @description clean up gates + extra gates

x_pos1 = gate_left.x;
x_pos2 = gate_right.x;

//make sure enemies aren't created in walls
if place_meeting(x,y,oWall) {
	if !place_meeting(x,y-32,oWall) y-=32;
}


if instance_number(object_index) > 1 {
	var target = instance_nearest_notme(x,y,object_index);

	if target != 0 {
		alarm[1] = 10;
	}
}