if !instance_exists(oEnemyParent) {
	if ds_list_size(waves)>current_wave {
		current_wave_check=ds_list_find_value(waves,current_wave)
		with(oWavePos) {
			for(var i = 0; i < other.current_wave_check.pos_checks; i++) {
				if wave_pos_id==other.current_wave_check.pos[i] {
					instance_create_layer(x,y,"Enemies",other.current_wave_check.enemy[i])	
				}
			}
		}
	}
	current_wave++	
}
if ds_list_size(waves)<=current_wave { 
	room_cleared=true;
	if !instance_exists(oEnemyParent) {
		with(oBlockade) instance_destroy();
	}
	//show text: level cleared!
}



