///@desc generate enemy selection per level

#region general
	touched_gate = false;
	gate_active = false; //on/off
	image_speed = 0;
	
	// Gates / walls on each side of this object
	gate_left = 0; gate_right = 0;//gate IDs
	x_pos1 = 0; x_pos2 = 0; //gate positions
	n_pos1 = 0; n_pos2 = 0; //neighbour gates (checks for incorrect duplicates)
	shared_gate = false; 
	shared_left = false; shared_right = false; //gate flags
	alarm[0] = 10; //gate checker AFTER BattleGate alarm. (move this to one object later somehow). 

#endregion


#region create DS grid for enemies

	grid_wave = ds_grid_create(3,4);
	grid_x = irandom(2); //choose from list of 3 (make this dynamic later)
	grid_y = 0; //spawn 0, 1, 2, etc (use max_height for now. make this more dynamic later)
	grid_y_max = 2; //check this dynamically later
	spawn = grid_wave[# grid_x, grid_y];
	ds_grid_clear(grid_wave,0);
#endregion

#endregion write enemies for first level
	grid_wave[# 0, 0] = oEnemy_Mage; //"mage1";
	grid_wave[# 0, 1] = oEnemy_Mage; //"mage2";
	grid_wave[# 0, 2] = oEnemyExploder; //"mage3 SUPER";
	grid_wave[# 0, 3] = oEnemy_Bat; //"mage3 SUPER";

	grid_wave[# 1, 0] = oEnemyMelee
	grid_wave[# 1, 1] = oEnemy_Bat
	grid_wave[# 1, 2] = oEnemyMelee;
	grid_wave[# 1, 3] = oEnemyMelee;

	grid_wave[# 2, 0] = oRockBug;
	grid_wave[# 2, 1] = oRockBug;
	grid_wave[# 2, 2] = oEnemyMelee;
	grid_wave[# 2, 3] = oEnemyMelee;
#endregion





//misc
depth = layer_get_depth("Bullets");
col_debug = choose(c_orange,c_blue,c_lime,c_navy, c_yellow);
