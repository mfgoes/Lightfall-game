/// @description destroy self when required
with(oPlayer) { //prevent player from walking through this
	if (place_meeting(x+hsp,y, oBlockade))
		{
			if (!place_meeting(x+sign(hsp),y,oBlockade))
			{
				x = x + sign(hsp); 
			}
			hsp = 0;
		}
}



//if conditional blockade, check for wave number in wave object
if wave_unlock != 0 { 
	if wave_unlock = oWaveSystem.current_wave
		instance_destroy(); 
} 
else with(oWaveSystem) {
	if ds_list_size(waves)<=current_wave { 
		if !instance_exists(oEnemyParent) {
			room_cleared=true;
			with(oBlockade) instance_destroy();
		}
		//show text: level cleared!
	}
}