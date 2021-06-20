/// @description dynamic enemy spawner object
spawn_type = oEnemyRangedGeneric;
spawn_amount = 7;
spawn_timer = room_speed*2; //every two seconds
alarm[0] = spawn_timer;
//grid_size = 32; 

/*You can use this with timed enemy waves. The below are default but can be changed
FUTURE UPDATES: Allow spawning enemy variations with special attributes. 
Special enemies have a different color*/

//super_size = false;
//explosive = false;
//toxic = false; 
//has_shield = false; //shield HP is 1/3 of max_hp. Shielded enemies have a special outline. 