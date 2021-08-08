/// @description dynamic enemy spawner object
spawn_type = oEnemyRangedGeneric;
spawn_amount = 2; 
global.wavetotal = spawn_amount;
alarm[2] = 5; //count existing enemies in room and add to total


killtextscale = 1;
spawn_timer = 50; //every two seconds
alarm[0] = spawn_timer;
title_alpha = 0;

//grid_size = 32; 

/*You can use this with timed enemy waves. The below are default but can be changed
FUTURE UPDATES: Allow spawning enemy variations with special attributes. 
Special enemies have a different color*/

//super_size = false;
//explosive = false;
//toxic = false; 
//has_shield = false; //shield HP is 1/3 of max_hp. Shielded enemies have a special outline. 