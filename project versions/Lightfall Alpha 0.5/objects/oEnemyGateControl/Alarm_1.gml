/// @description check connections
var target = instance_nearest_notme(x,y,oEnemyGateControl );
n_pos1 = target.x_pos1;
n_pos2 = target.x_pos2;

if x_pos2 = n_pos1 {
	shared_gate = true; //if sharing with one on the left
	//target.shared_gate = true; 	
	if target.x > x {
		shared_right = true;
		//target.shared_left = true;
		alarm[1] = 5;
	}
}

/// @description check connections for errors
var target = instance_nearest_notme(x,y,oEnemyGateControl );

if target.shared_right = true && target.x > x{
	target.shared_left = true;
}
if shared_left = true && shared_right = true {
	instance_destroy();
} 
else { //if connections are made correctly, update the gates. 
	with(gate_left) {text_debug = "left"; other_gate = other.gate_right }
	with(gate_right) {text_debug = "right"; other_gate = other.gate_left}
}



