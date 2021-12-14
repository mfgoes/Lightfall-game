/// @desc local enemy wave controller (make a global version later)
//Perhaps the global one can have control over local ones. ie to diversifiy enemy options
wave_active = false; //trigger with vk_up

//this is the grid for the first biome/levels. 
grid_wave = ds_grid_create(3,3);
grid_x = 0;
grid_y = 0;

grid_x = irandom(2); 

//Fill
ds_grid_clear(grid_wave,0);

//Write
grid_wave[# 0, 0] = "mage1";
grid_wave[# 0, 1] = "mage2";
grid_wave[# 0, 2] = "mage3 SUPER";

grid_wave[# 1, 0] = "titan";
grid_wave[# 1, 1] = "titan2";
grid_wave[# 1, 2] = "titan3";

grid_wave[# 2, 0] = "slime";
grid_wave[# 2, 1] = "slime2";
grid_wave[# 2, 2] = 0;

test_var = 10;