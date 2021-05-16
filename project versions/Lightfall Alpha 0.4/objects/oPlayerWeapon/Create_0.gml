/// @desc weapon init
#region //basic setup
	primary_cooldown_full = oPlayer.primary_cooldown; //when cooldowns are full 
	secondary_cooldown_full = oPlayer.secondary_cooldown;
	third_cooldown_full = oPlayer.third_cooldown;
	controllerangle = 0;
#endregion

#region //Weapon data ------ Set primary weapon as bow
	current_weapon  = 0; //this is the archer weapon. Put into player data script later
	weapon_charge = 0; 
	weapon_charge_max = 5;
	weapon_recoil = 0;
	gunkickx = 0;
	gunkicky = 0;
	//visuals
	image_speed = 0;
	image_alpha = 0;
	weapon_active = 0; 
	flip_weapon = 0;
	
	shots_total = 0; //for triple shot
	sound_shot = lux_shot_03; 
#endregion

///Added zoom
weapon_zoom = 0; //clamp between 0.05 and 0.2);
