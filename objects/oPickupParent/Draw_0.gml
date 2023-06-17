/// @description flash when appearing
draw_self();
effect_flash();

switch (pickup_type) {
	case 0: 
		sprite_index = pickup_ammo; 
	break;
	case 2: 
		sprite_index = pickup_health; 
	break; 		
}