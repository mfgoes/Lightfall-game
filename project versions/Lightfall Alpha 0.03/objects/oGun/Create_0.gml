/// @desc weapon init
#region //basic setup
	primary_cooldown_full = oPlayer.primary_cooldown;
	primary_cooldown = primary_cooldown_full;
	
	secondary_cooldown_full = oPlayer.primary_cooldown;
	controllerangle = 0;
	if (global.hasgun == false) instance_destroy();
#endregion

#region //Weapon data ------ Set primary weapon as bow
	current_weapon  = 0; //this is the archer weapon. Put into player data script later
	weapon_charge = 0; 
	weapon_charge_max = 8;
	weapon_recoil = 0;
	
	//visuals
	image_speed = 0;
	image_alpha = 0;
	weapon_active = 0; 
	flip_weapon = 0;
#endregion

///Added zoom
weapon_zoom = 0; //clamp between 0.05 and 0.2);
