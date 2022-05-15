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
