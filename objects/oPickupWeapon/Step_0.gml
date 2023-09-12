/// @description Insert description here
// You can write your code in this editor
if global.game_paused
{
	exit;
}

//gravity + movement
hsp *= 0.6;
x+=hsp;
VerticalCollision(); 

nearby =  (distance_to_object(oPlayer) < TILE_SIZE && (!instance_exists(oText)));

//pickup by player


if keyboard_check(ord("E")) && (nearby) {
	//change weapon
	with (oPlayerWeapon) {
		current_weapon = other.current_weapon; 	
		var weapon_struct = global.weapon_list[oPlayerWeapon.current_weapon];
		var weapon_name = weapon_struct.weapon_name;
		show_debug_message("picked up a " + (string(weapon_name) + "!"));
		
		//show weapon name
		//dd = instance_create_depth(x,y-50,depth,oToastUI);
		//dd.str = "picked up a " + (string(weapon_name) + "!");
		//dd.toast_type = variant.upgrade;
		
		//show ammo of this weapon
		dd = instance_create_depth(x,y-45,depth,oToastUI);
		dd.str = "+" + string(other.startAmmo); 
		dd.toast_type = variant.upgrade;
	}
	
	//if available, switch weapons (do this later)
	
	//destroy
	instance_destroy();
	audio_play_sound(snd_button2,2,0,0.5);
	audio_play_sound(snClick,3,0,0.24);	
}