if !instance_exists(oEnemyParent) {
	if ds_list_size(waves)>current_wave { //if more waves left in list
		current_wave_check=ds_list_find_value(waves,current_wave)
		
		//check all spawn locations, and spawn enemy if it's the right number
		with(oWavePos) {
			for(var i = 0; i < other.current_wave_check.pos_checks; i++) {
				
				//TO DO: check if player is close enough, then do this. Otherwise, check for nearest spawner to spawn at (randomized a bit)  
				
				if wave_pos_id==other.current_wave_check.pos[i] {	//if ID = spawner ID
					instance_create_layer(x,y,"Enemies",other.current_wave_check.enemy[i])	
				}
			}
		}
	}
	current_wave++	
}

//finish the wave
if ds_list_size(waves)<=current_wave { 
	room_cleared=true;
	if !instance_exists(oEnemyParent) {
		with(oBlockade) instance_destroy();
	}
	//show text: level cleared!
}


#region debug mode (spawn test enemies)
	if (global.debugmode) {
		if keyboard_check_pressed(vk_enter) {
			with(oCamera) instance_create_depth(follow.x,follow.y,follow.depth,oEnemyMelee);	
		}
	
	}
#endregion
