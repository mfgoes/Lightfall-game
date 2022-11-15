/// @desc local enemy wave controller

#region create DS grid
	//this is the grid for the first biome/levels. 
	grid_wave = ds_grid_create(7,1);
	grid_x = 0;
	grid_y = 0; //spawn 0, 1, 2, etc (use max_height for now. change to be more dynamic later)
	spawn = grid_wave[# grid_x, grid_y];

	//Fill
	ds_grid_clear(grid_wave,0);
	//Write
	grid_wave[# 0, 0] = oEnemy_Mage; //"mage1";
	grid_wave[# 1, 0] = oEnemyMelee;
	grid_wave[# 2, 0] = oRockBug;
	grid_wave[# 3, 0] = oEnemy_Bat;
	grid_wave[# 4, 0] = oEnemyExploder;
	grid_wave[# 5, 0] = oEnemyShield;
	grid_wave[# 6, 0] = oEnemy_Boss;
	grid_wave[# 7, 0] = oDummyEnemy;

#endregion
