/// @description draw in-game UI
killtextscale = 1;   
fps_reader = 0;
alarm[0] = 20; //read fps every few steps, not every step. 

#region draw cooldowns
	primary_cooldown	= 20;
	primary_cooldown_max = primary_cooldown; 

	secondary_cooldown  = 6;
	secondary_cooldown_max = secondary_cooldown;

	third_cooldown		= 20; 
	third_cooldown_max = third_cooldown;

	roll_cooldown		= oPlayer.roll_cooldown_full; 
	roll_cooldown_max = roll_cooldown;
	#endregion

#region helper text variables
show_levelname = 0; //turn back to 0 at the start of each room
levelname_opacity = 0.02;

show_objective = false; //show if you should either kill boss or find objective
#endregion

//determinse level name
level_name = "Abandoned Canals"
if room != r_1_TrailedCanal level_name = room_get_name(room); //rename room to asset name

image_alpha = 0;