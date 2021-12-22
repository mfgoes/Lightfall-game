/// @description spawn enemy
if global.game_paused
{
	exit;
}

//spawn from ds grid
spawn = grid_wave[# grid_x, grid_y];

//randomize position
var x_var = random_range(-50,50);

if spawn != 0 && grid_y < grid_y_max {
	instance_create_depth(x+x_var,y,depth,spawn)
	grid_y+=1; 
}
else { //exit spawning
	exit;
}

alarm[0] = 20;