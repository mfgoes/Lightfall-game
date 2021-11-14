/// @description dynamic enemy spawner object
x_pos1 = 0; //this should always be the smaller number. Add a double check later. 
x_pos2 = 0;

x = (x_pos1 + x_pos2) / 2;

spawn_type = oEnemyRangedGeneric; //diversify this later
spawn_amount = 0; 
global.wavetotal = spawn_amount;


//start spawning enemies, only when 'activated'
start_spawning = false; //activate through gates object or other means
spawn_timer = 50; 
//alarm[0] = spawn_timer;
