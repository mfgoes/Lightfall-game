/// @description Initialize Variables

//Size of gridcell in pixels.
cellSize = 32;

//Create and store ID of cellChecker
myChecker = instance_create_layer(x,y,"Cursor",cell_checker);

//Wall to create.
wallObj = obj_wall_sand;