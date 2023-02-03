/// @description check if can open

if instance_exists(oWaveSystem) {
	if ds_list_size(oWaveSystem.waves)<oWaveSystem.current_wave && !instance_exists(oEnemyParent){ 
		//show text: level cleared!
		other.image_index = 1;
		other.locked = false; 
		}
}


//show arrow
if instance_exists(oPlayer) {
	if distance_to_object(oPlayer) < 100 && (!instance_exists(oText))
	{
		nearby = true;
		
		if (keyboard_check_pressed(ord("W"))) or (keyboard_check_pressed(ord("S"))) {
		show_hint = true; 	
		}
	} else {
		nearby = false; 
		show_hint = false; 
	}
	
	//hover effect
	direction+=0.05;
	hover += cos(direction)/3;

	
}
