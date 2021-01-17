//score system
global.hasgun = true;
global.kills = 0;
global.killsthisroom = 0;
global.skipmenu = 0; 
global.exp_points = 0;
global.exp_points_thisroom = 0;

killtextscale = 1;            

//create important objects
if !instance_exists(oCamera) {
	dd = instance_create_depth(0,0,depth,oCamera);
	dd.follow = oPlayer;
}
if !instance_exists(oTransition) {
	instance_create_depth(0,0,depth,oTransition);
}