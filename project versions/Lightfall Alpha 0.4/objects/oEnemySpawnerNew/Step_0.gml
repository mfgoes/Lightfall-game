/// @description activate all gates
/*
if gate_left != noone && gate_right != noone {
	if gate_left.touched_gate = true or gate_right.touched_gate = true {
		touched_gate = true;
		gate_left.touched_gate = true;
		gate_right.touched_gate = true;
	}
}
*/

//destroy walls if no enemies left
//reset global.wavetotal - global.killsthiswave

//MOVE THIS LATER
if touched_gate = true && global.wavetotal != 0 {	//destroy walls
	if global.wavetotal - global.killsthiswave = 0 {
		gate_active = false;
		gate_left.gate_active = false;
		gate_right.gate_active = false;
	}
}