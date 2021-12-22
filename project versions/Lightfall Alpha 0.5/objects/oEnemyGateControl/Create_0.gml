/// @desc init

#region create DS grid
	//this is the grid for the first biome/levels. 
	grid_wave = ds_grid_create(3,3);
	grid_x = 0;
	grid_y = 0; //spawn 0, 1, 2, etc (use max_height for now. change to be more dynamic later)
	grid_y_max = 3; //check this dynamically later*

	grid_x = irandom(2); 
	spawn = grid_wave[# grid_x, grid_y];

	//Fill
	ds_grid_clear(grid_wave,0);
	//Write
	grid_wave[# 0, 0] = oEnemyRangedGeneric; //"mage1";
	grid_wave[# 0, 1] = oEnemyRangedGeneric; //"mage2";
	grid_wave[# 0, 2] = oEnemyExploder; //"mage3 SUPER";

	grid_wave[# 1, 0] = oEnemyMelee
	grid_wave[# 1, 1] = oEnemy_Bat
	grid_wave[# 1, 2] = oEnemyMelee

	grid_wave[# 2, 0] = oEnemyMelee
	grid_wave[# 2, 1] = oEnemyMelee;
	grid_wave[# 2, 2] = 0;
#endregion

touched_gate = false;
gate_active = false; //on/off
image_speed = 0;

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
