// Script assets have changed for v2.3.0 see
/// @desc everything regarding player weapons
function init_weapon_variables(){
	//standard values
	gunkickx = 2;
	gunkicky = 0;
	flash = 0; 
	//icon_image = 0;	
	
	// Ammo Types
    ammo_basic = 0; //quick shots
    ammo_heavy = 3; //the strong bow attack
    ammo_explosive = 2; //explosive shots
	weapon_charge = 0; //for things like bows
	weapon_charge_max = 5;
	weapon_accuracy = 2;
	
	//basic speed of each weapon
	reload_time			= 40; //main weapon
	secondary_cooldown  = 50; //melee weapon
	third_cooldown		= 30; 
	roll_cooldown		= 40;
	
	// Weapons
	none = new Weapon("No weapon", sBow_Slimmer, ammo_basic, 0, 0, 0, 0,5);
    bow = new Weapon("Bow", sBow_Slimmer, ammo_basic, 30, 2, 0, 1, 4);
    fast_gun = new Weapon("Fast Gun", sGun, ammo_basic, 30, 3, 0, 2, 6);
    heavy_gun = new Weapon("Heavy Gun", sGun, ammo_heavy, 30, 4, 1, 3, 20);
    explosive_gun = new Weapon("Explosive Gun", sGun, ammo_explosive, 30, 5, 2, 3, 15);
    bazooka = new Weapon("Bazooka", sGun, ammo_explosive, 30, 8, 4, 3, 3);
	
	global.weapon_list = [none, bow, fast_gun, heavy_gun, explosive_gun, bazooka];
	
	// Current Weapon (This can be a reference to one of the weapon structs)
    current_weapon = 0; //0 = none, 1 = regular	we
	using_ability = 0;
	
	//find a way to remove these later
	

}

function Weapon(_name, _sprite_index, _ammoType, _reload_time, _kickbackX, _kickbackY,_icon_image,_start_ammo) constructor {
    weapon_name = _name;
    sprite = _sprite_index;
	icon_image = _icon_image; 
    ammoType = _ammoType;
    kickbackX = _kickbackX;
    kickbackY = _kickbackY;
	reload_time = _reload_time; 
	startAmmo = _start_ammo; 
}

function draw_weapon() {
	#region setup + draw sprite
	if timer_get("weapon_display") <= 0 or using_ability = true or current_weapon = 0 { // show/hide weapon
		image_alpha = 0;
	}
	else 
		image_alpha = 1;
	
	if current_weapon != 0 {
		var facing_dir = oPlayer.facing_direction;
		if aim_360 = true facing_dir = image_angle;
		var flip_image = sign(dcos(oPlayer.facing_direction)) * 0.9 + dcos(oPlayer.facing_direction)*0.2;
		if flip_image = 0 flip_image = 1;
		draw_sprite_ext(sprite_index,image_index,x,y,1,flip_image,facing_dir,c_white,image_alpha);
	}
	#endregion

	//bow charging effect
	if weapon_charge > 2 
	{
		var color_line = make_colour_rgb(53, 78, 76);
		var facing_dir = oPlayer.facing_direction;
		gpu_set_blendmode(bm_add);
		draw_line_width_color(x,y,x+lengthdir_x(5+weapon_charge*4,facing_dir),y+lengthdir_y(5+weapon_charge*4,facing_dir),15,c_black,color_line);
		gpu_set_blendmode(bm_normal);
	}	
}
	
