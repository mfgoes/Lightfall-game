/// @desc init

//spawn enemy code
spawn_type = oEnemyRangedGeneric; //diversify this later
spawn_amount = 1; 
spawn_timer = 10;
touched_gate = false;
alarm[2] = 20; //spawn an enemy

//gate code
alarm[0] = 5; //gate checker
gate_left = 0; gate_right = 0;//gate IDs
x_pos1 = 0; x_pos2 = 0; //gate positions
n_pos1 = 0; n_pos2 = 0; //neighbour gates
shared_gate = false; 
shared_left = false; shared_right = false; //gate flags

//check_pos = 0; //???
//check_pos_gate = 0;

//misc
depth = layer_get_depth("Bullets");
col_debug = choose(c_orange,c_blue,c_lime,c_navy, c_yellow);
