//@desc move this to generator code later
global.killsthisroom = 0;
global.exp_points_thisroom = 0;

//generate objects / randomizer codes. Move this to a single script later
if room != rMenu {
	//Biome generator
	instance_create_depth(x,y,depth,oLevelGenerator);	
	//UI
	instance_create_depth(x,y,depth,oUIElements);
	//camera
	if !instance_exists(oCamera) {
			dd = instance_create_depth(0,0,depth,oCamera);
			dd.follow = oPlayer;
		}
	if !instance_exists(oTransition) {
		instance_create_depth(0,0,depth,oTransition);
	}	
}