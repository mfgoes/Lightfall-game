/// @desc local enemy wave controller (make a global version later)
//Perhaps the global one can have control over local ones. ie to diversifiy enemy options
wave_active = false; //trigger with vk_up

#region create DS grid
	//this is the grid for the first biome/levels. 
	grid_wave = ds_grid_create(3,3);
	grid_x = 0;
	grid_y = 0; //spawn 0, 1, 2, etc (use max_height for now. change to be more dynamic later)
	grid_y_max = 4; //check this dynamically later*

	grid_x = irandom(2); 
	spawn = grid_wave[# grid_x, grid_y];

	//Fill
	ds_grid_clear(grid_wave,0);
	//Write
	grid_wave[# 0, 0] = oEnemyRangedGeneric; //"mage1";
	grid_wave[# 0, 1] = oEnemyRangedGeneric; //"mage2";
	grid_wave[# 0, 2] = oEnemyExploder; //"mage3 SUPER";
	grid_wave[# 0, 3] = oEnemyMelee

	grid_wave[# 1, 0] = oEnemyMelee
	grid_wave[# 1, 1] = oEnemy_Bat
	grid_wave[# 1, 2] = oEnemyMelee
	grid_wave[# 1, 3] = oEnemyMelee

	grid_wave[# 2, 0] = oEnemyMelee2
	grid_wave[# 2, 1] = oEnemyMelee2;
	grid_wave[# 2, 2] = oEnemy_Bat;
	grid_wave[# 2, 2] = oEnemyRangedGeneric;
#endregion
