/// @description Parent + custom code
event_inherited();

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