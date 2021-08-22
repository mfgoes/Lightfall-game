/// @description draw in-game UI
//this used to be in the oGame object, moved for clarity (21 Aug 2021)
killtextscale = 1;   
fps_reader = 0;
alarm[0] = 20; //read fps every few steps, not every step. 

//draw cooldowns from player weapon
primary_cooldown	= 20;
primary_cooldown_max = primary_cooldown; 

secondary_cooldown  = 6;
secondary_cooldown_max = secondary_cooldown;

third_cooldown		= 20; 
third_cooldown_max = third_cooldown;

roll_cooldown		= oPlayer.roll_cooldown_full; 
roll_cooldown_max = roll_cooldown;