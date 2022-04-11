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
		
		//audio queue
		if !audio_is_playing(snLevelClear_Special_Click_05) {
			audio_sound_gain(snLevelClear_Special_Click_05,0.5,0);
			audio_play_sound(snLevelClear_Special_Click_05,0,0);
		}
	}
}

//failsafe
if  global.wavetotal - global.killsthiswave < 0 {
	global.wavetotal = 0;
	global.killsthiswave = 0;
}

#region reconfigure gate neighbours (move this elsewhere later)
	if gate_active = false {
		gate_right.other_gate = gate_left.id; 
		gate_left.other_gate = gate_right.id; 
		gate_left.move_dir = 1;
		gate_right.move_dir = -1;
	}
#endregion
