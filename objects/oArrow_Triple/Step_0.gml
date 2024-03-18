/// @description Parent + custom code
event_inherited();

if spd > 0 { //check if in wall
	//gravity + movement
	if vsp < 20 vsp+=grv;
	x+= lengthdir_x(spd,direction);
	y+= lengthdir_y(spd,direction)+vsp;
	image_angle = point_direction(xprevious,yprevious,x,y); angle_prev = image_angle;

	//poof 
	if timer_get("poof_trail") <= 1 {
		dd = instance_create_depth(x,y,depth+1,oDust); dd.hsp = 0; dd.vsp = 0; dd.image_alpha = 0.5; dd.image_speed = 1.5; dd.life = 30; if random(1)<0.4 dd.col_start = c_aqua;
		timer_set("poof_trail",3);
	}
} else {
	vsp = 0;
	image_angle = angle_prev+angle_randomize;
}


//destroy after a certain distance
if point_distance(x,y,xstart,ystart) > distance_max {
	//poof
	repeat(3) with (instance_create_layer(x,y,"Bullets",oDust)) {
			vsp = -1.5; if random(1) < 0.2 vsp = 1; image_alpha = 0.6+random(0.3);
			hsp = random_range(-1,1);
			image_index = irandom(image_number);
			image_xscale = choose (1.5,-1.5);
			image_yscale = choose (1.5,-1.5);
	}
	instance_create_depth(x+lengthdir_x(6,direction),y,depth,oBulletImpactEffect);
	instance_destroy();
	
}