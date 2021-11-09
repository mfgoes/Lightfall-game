/// @description dynamic enemy spawner object
x_pos1 = 0; //this should always be the smaller number. Add a double check later. 
x_pos2 = 0;

x = (x_pos1 + x_pos2) / 2;

spawn_type = oEnemyRangedGeneric;
spawn_amount = 0; 
global.wavetotal = spawn_amount;

killtextscale = 1;
spawn_timer = 50; //every two seconds
alarm[0] = spawn_timer;
