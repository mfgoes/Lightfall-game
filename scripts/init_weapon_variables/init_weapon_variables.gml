// Script assets have changed for v2.3.0 see
/// @desc everything regarding player weapons
function init_weapon_variables(){
	//angle the weapon
	aim_360 = true; //if this is turned off, it switches to assisted RoR aiming. 
	angle_range = 45; //how much auto aim is allowed. Change to 360 for full auto aim.
	angle_in_range = true; //check if auto aim is allowed
	shoot_direction = 0;
	assist_dist = 200;
	click_dir = 0; 
	combo_counter = 0; 

	//standard values
	gunkickx = 2;
	gunkicky = 0;
	flash = 0; 
	
	// Animation
	isShooting = false;
	animationEnd = false;
	image_speed = 0;
	image_alpha = 0;
	
	// Ammo Types
    ammo_basic = 0; //quick shots
    ammo_heavy = 3; //the strong bow attack
    ammo_explosive = 2; //explosive shots
	weapon_recoil = 0;
	weapon_active = 0; //if the weapon is visible
	weapon_charge = 0; //for things like bows
	weapon_charge_max = 5;
	weapon_accuracy = 2;
	
	//basic speed of each weapon
	reload_time			= 40; //default ranged
	secondary_cooldown  = 50; //default melee
	third_cooldown		= 30; 
	roll_cooldown		= 40;
	
	// No weapon - no damage and immediate reload.
	none = new Weapon("No weapon", sBow_Slimmer, ammo_basic, 0, 0, 0, 0, 5, 0);
	// Bow - moderate damage, moderate reload time.
	bow = new Weapon("Bow", sBow_Slimmer, ammo_basic, 12, 25, 2, 0, 1, 4);
	// Fast Gun - lower damage per shot, but quick reload time.
	fast_gun = new Weapon("Fast Gun", sGunFast, ammo_basic, 5, 15, 3, 0, 2, 6);
	// Heavy Gun - high damage, longer reload time.
	heavy_gun = new Weapon("Heavy Gun", sGunSlow, ammo_heavy, 20, 40, 4, 1, 3, 20);
	// Explosive Gun - very high damage due to explosions, longer reload time.
	explosive_gun = new Weapon("Explosive Gun", sGunExplosive, ammo_explosive, 25, 45, 5, 2, 3, 15);
	// Bazooka - extreme damage, very long reload time.
	bazooka = new Weapon("Bazooka", sGunBazooka, ammo_explosive, 30, 60, 8, 4, 3, 3);

	global.weapon_list = [none, bow, fast_gun, heavy_gun, explosive_gun, bazooka];
	
	// Current Weapon (This can be a reference to one of the weapon structs)
    current_weapon = 1; //0 = none, 1 = regular	we
	using_ability = 0;
	
	//find a way to remove these later
	

}

function Weapon(_name, _sprite_index, _ammoType, _damage, _reload_time, _kickbackX, _kickbackY, _icon_image, _start_ammo) constructor {
    weapon_name = _name;
    sprite = _sprite_index;
    icon_image = _icon_image; 
    ammoType = _ammoType;
    damage = _damage;
    kickbackX = _kickbackX;
    kickbackY = _kickbackY;
    reload_time = _reload_time; 
    startAmmo = _start_ammo; 
}

function draw_weapon_sprite() {
	
	var facing_dir = oPlayer.facing_direction;
	if aim_360 = true facing_dir = image_angle;
	var flip_image = sign(dcos(oPlayer.facing_direction)) * 0.9 + dcos(oPlayer.facing_direction)*0.2;
	if flip_image = 0 flip_image = 1;
	
	var weapon_struct = global.weapon_list[current_weapon]; 
	var sprite = weapon_struct.sprite;
    var weapon_reload_time = weapon_struct.reload_time;

	//if timer_get("weapon_display") <= 0 or using_ability = true or current_weapon = 0 { // show/hide weapon
	//	image_alpha = 0;
	//}
	//else 
	if current_weapon != 0 
		image_alpha = 1;

	//bow charging effect
	if weapon_charge > 2 && current_weapon = 2
	{
		var color_line = make_colour_rgb(53, 78, 76);
		var facing_dir = oPlayer.facing_direction;
		gpu_set_blendmode(bm_add);
		draw_line_width_color(x,y,x+lengthdir_x(5+weapon_charge*4,facing_dir),y+lengthdir_y(5+weapon_charge*4,facing_dir),15,c_black,color_line);
		gpu_set_blendmode(bm_normal);
	}
	
	draw_sprite_ext(sprite,image_index,x,y,1,flip_image,facing_dir,c_white,image_alpha);	
}	