///@desc load a specific weapon file
#region essentials
	image_speed = 0;
	image_alpha = 0;
	gunkickx = 3;
	gunkicky = 0;
	weapon_recoil = 0;
	weapon_active = 0; 
	
	//angle the weapon
	aim_360 = true; //if this is turned off, it switches to assisted RoR aiming. 
	angle_range = 45; //how much auto aim is allowed. Change to 360 for full auto aim.
	angle_in_range = true; //check if auto aim is allowed
	shoot_direction = 0;
	assist_dist = 200;
	click_dir = 0; 
	combo_counter = 0; 
#endregion

LoadWeapon_Archer();
 
// Animation
isShooting = false;
animationEnd = false;