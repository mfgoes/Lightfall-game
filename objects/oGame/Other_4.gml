//@desc move this to generator code later
global.killsthisroom = 0;
global.exp_points_thisroom = 0;

//generate objects / randomizer codes. Move this to a single script later
	//UI
	if !instance_exists(oUIElements)
	instance_create_depth(x,y,depth,oUIElements);
	
	if !instance_exists(oTransition) {
		instance_create_depth(0,0,depth,oTransition);
	}	
	
	if instance_exists(oPlayer) {
		//camera
		dd = instance_create_depth(0,0,depth,oCamera);
		dd.follow = oPlayer;
		//Biome generator
		if !instance_exists(oLevelGenerator)
		instance_create_depth(x,y,depth,oLevelGenerator);	
	}
	
