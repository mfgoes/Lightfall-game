/// @desc move through grid
if global.game_paused
{
	exit;
}


spawn = grid_wave[# grid_x, grid_y];
var grid_x_max = ds_grid_width(grid_wave);


if keyboard_check_pressed(vk_anykey) {
switch (keyboard_key) {
    
case vk_up:
    if (ds_grid_get(grid_wave,grid_x,0) != undefined) {
    var x_var = random_range(-50,50);
    instance_create_depth(x+x_var,y,depth,spawn);
    }
    break;
case vk_right:
     if grid_x < grid_x_max grid_x++; else grid_x = 0;
     break;
case vk_left: 
    if grid_x > 0 grid_x --; else grid_x = grid_x_max;
    break;
}
}