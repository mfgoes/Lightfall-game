/// @description activate all gates


//destroy walls if no enemies left
//reset global.wavetotal - global.killsthiswave

//deactivate gate
if global.wavetotal != 0 && gate_left.gate_active = true {	
	if global.wavetotal - global.killsthiswave <= 0 {
		gate_active = false;
		gate_left.gate_active = false;
		gate_right.gate_active = false;
		global.wavetotal = 0;
		global.killsthiswave = 0;
	}
}

//failsafe
if  global.wavetotal - global.killsthiswave < 0 {
	global.wavetotal = 0;
	global.killsthiswave = 0;
}