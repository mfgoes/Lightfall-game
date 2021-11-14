/// @description Insert description here
// You can write your code in this editor
spawn_type = oEnemyRangedGeneric; //diversify this later
spawn_amount = 0; 
gate_left = 0; //store ID of related gates
gate_right = 0;
x_pos1 = 0; x_pos2 = 0; 

alarm[0] = 20; 

//check for gate errors (ie shared gate)
shared_gate = false; 
shared_right = false; 
shared_left = false; 

n_pos1 = 0; //neighbour gate positions
n_pos2 = 0;

check_pos = 0;
check_pos_gate = 0;
alarm[1] = 40; //check shared gates



col_debug = choose(c_orange,c_blue,c_lime,c_navy, c_yellow);


/*
//start spawning enemies, only when 'activated'
start_spawning = false; //activate through gates object or other means
spawn_timer = 50; 
//alarm[0] = spawn_timer;


if gate_left != 0 && gate_right != 0 {
	x_pos1 = gate_left.x; x_pos2 = gate_right.x;
}


*/

depth = layer_get_depth("Bullets");