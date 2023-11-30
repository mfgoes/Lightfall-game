/// @description Parent + custom code
event_inherited();

if(live_call()) return live_result;

//destroy after a certain distance
if abs(x-xstart) > distance_max or abs(y-ystart) > distance_max {
	repeat(3) {
	var fx_dir = direction + random_range(-90,90); 
	var fx_spd = 3;
	
	dd = instance_create_depth(x+lengthdir_x(0,direction)+random_range(-4,4),y+lengthdir_y(0,direction)+random_range(-2,2),depth,oDust);
	dd.hsp = lengthdir_x(fx_spd, fx_dir);
	dd.vsp = lengthdir_y(fx_spd, fx_dir);
	dd.image_alpha = choose(0.3,0.5,0.8);
	dd.image_xscale = 1; 
	dd.image_yscale = 1;
	}
	
	dd = instance_create_depth(x+lengthdir_x(6,direction),y,depth,oBulletImpactEffect);
	dd.image_xscale = 1.5; 
	dd.image_yscale = 1.5; 
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
		dd = instance_create_depth(x,y,depth+1,oDust); dd.hsp = 0; dd.vsp = 0; dd.image_alpha = 0.1; dd.image_speed = 1;
		timer_set("poof_trail",4+choose(1,2));
	}
	if timer_get("poof_trail_close") <= 1 {
		dd = instance_create_depth(x,y,depth+1,oDust); dd.hsp = 0; dd.vsp = 0; dd.image_alpha = 0.5; dd.image_speed = 2; 
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

