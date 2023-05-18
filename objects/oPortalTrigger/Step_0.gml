/// @description check if can open

if instance_exists(oWaveSystem) {
	if ds_list_size(oWaveSystem.waves)<oWaveSystem.current_wave && !instance_exists(oEnemyParent){ 
		if other.locked = true {
			var _x = oCamera.x; var _y = oCamera.y; 
			dd = instance_create_depth(_x,_y-40,0,oToastUI); 
			dd.str = "Level complete!" 
			dd.toast_type = variant.h2; 
		}
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
