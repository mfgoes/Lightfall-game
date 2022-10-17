/// @description Parent + custom code
event_inherited();

if(live_call()) return live_result;

//destroy after a certain distance
if abs(x-xstart) > distance_max {
	//poof
	repeat(7) with (instance_create_layer(x,y,"Bullets",oDust)) {
			vsp = -1.5; if random(1) < 0.2 vsp = 1; image_alpha = 0.6+random(0.3);
			hsp = random_range(-1,1);
			image_index = irandom(image_number);
			image_xscale = choose (1.5,-1.5);
			image_yscale = choose (1.5,-1.5);
	}
	instance_create_depth(x+lengthdir_x(6,direction),y,depth,oBulletImpactEffect);
	ScreenShake(1,3);
	instance_destroy();
	
}

if spd > 0 { //check if in wall
	//gravity + movement
	if vsp < 20 vsp+=grv;
	x+= lengthdir_x(spd,direction);
	y+= lengthdir_y(spd,direction)+vsp;

	//poof 
	if timer_get("poof_trail") <= 1 {
		dd = instance_create_depth(x,y,depth+1,oDust); dd.hsp = 0; dd.vsp = 0; dd.image_alpha = 1; dd.image_speed = 0.2;
		timer_set("poof_trail",4+choose(1,2));
	}
	if timer_get("poof_trail_close") <= 1 {
		dd = instance_create_depth(x,y,depth+1,oDust); dd.hsp = 0; dd.vsp = 0; dd.image_alpha = 1; dd.image_speed = 2; 
		if super_arrow = true {dd.image_xscale = 1; dd.image_yscale = 1; dd.col_start = c_orange;}
		timer_set("poof_trail_close",1);
	}
} else vsp = 0;

if spd > 0 {
	image_angle = point_direction(xprevious,yprevious,x,y); angle_prev = image_angle
}
else image_angle = angle_prev+angle_randomize;

if (place_meeting(x,y,pShootable)) && active = true
{
	ScreenShake(1,2);	
}

