/// @desc changes the animation for player. 
function KillPlayer() {
	if instance_exists(oPlayerWeapon) with (oPlayerWeapon) instance_destroy();
	instance_change(oPlayerDead,true);
	
	
	//animation + movement
	direction = point_direction(other.x,other.y,x,y); 
	var flip_image = sign(dcos(facing_direction));
	image_xscale = flip_image;
	hsp = lengthdir_x(2,facing_direction);
	vsp =lengthdir_y(1,90);
	
	//extra effects
	instance_create_depth(x,y,depth-5,oDust);

	//reset level kills
	global.kills -= global.killsthisroom;
	global.exp_points -= global.exp_points_thisroom;
}
