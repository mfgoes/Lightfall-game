/// @description draw in-game UI
killtextscale = 1;   
fps_reader = 0;
alarm[0] = 20; //read fps every few steps, not every step. 

#region draw cooldowns (set by weapon object)
if instance_exists(oPlayerBow) {
	primary_cooldown	= oPlayerBow.primary_cooldown;
	primary_cooldown_max = primary_cooldown; 

	secondary_cooldown  = oPlayerBow.secondary_cooldown;
	secondary_cooldown_max = secondary_cooldown;

	third_cooldown		= oPlayerBow.third_cooldown; 
	third_cooldown_max = third_cooldown;

	roll_cooldown		= oPlayerBow.roll_cooldown;
	roll_cooldown_max = roll_cooldown;
}
	#endregion

#region helper text variables
show_levelname = 0; //turn back to 0 at the start of each room
levelname_opacity = 0.02;

show_objective = false; //show if you should either kill boss or find objective
#endregion

image_alpha = 0;
cursor_scale = 2; //change this when shooting