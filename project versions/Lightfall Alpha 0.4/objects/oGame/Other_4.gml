global.killsthisroom = 0;
global.exp_points_thisroom = 0;


//remove if duplicate
if instance_number(object_index) > 1 { instance_destroy() }
//create important objects
if !instance_exists(oCamera) {
	dd = instance_create_depth(0,0,depth,oCamera);
	dd.follow = oPlayer;
}
if !instance_exists(oTransition) {
	instance_create_depth(0,0,depth,oTransition);
}

