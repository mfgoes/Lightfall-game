if global.game_paused
{
	exit;
}

//GMLive
if (live_call()) return live_result; 

//timers start camera position
timer_init("zoom_out");
if timer_get("zoom_out") =-1 {timer_set("zoom_out",10)}
if start_zoom > 0 && alarm[0] = -1 {start_zoom-=0.001;} //start_zoom = -0.1; lerp this later (for smooth zoom out)

//Upate camera destination
if (instance_exists(follow)) 
{
	//while aiming, follow mouse position slightly
	var pan_distance_weapon = 3; if zoom <= 0.10 pan_distance_weapon = 3; //move camera when aiming?
	if (weapon_zoom !=0 && follow = oPlayer) {
		var pan_distance_weapon = clamp(point_distance(follow.x,follow.y,mouse_x,mouse_y),3,10); //max camera shift when focusing weapon
	}
	xTo = follow.x+lengthdir_x(pan_distance_weapon,point_direction(follow.x,follow.y,mouse_x,mouse_y)); //Follow point from A (followX) to B (mouseX). Lenghtdir should be a fraction of distance of mouse to follow.x
	yTo = follow.y+lengthdir_y(pan_distance_weapon,point_direction(follow.x,follow.y,mouse_x,mouse_y));
	
	if ((follow).object_index == oPlayerDead) {
		x = round(xTo);
		y = round(yTo);
	}
}
x = clamp(x,view_w_half+buff,room_width-view_w_half - buff); //maintain room boundaries buff = extra space for screenshake
y = clamp(y,view_h_half+buff,room_height-view_h_half - buff);

x += (xTo - x) / 4 // / 8; //cam_speed;
y += (yTo - y) / 2 // / 8; //cam_speed; 

//new zoom code utilizing weapon zoom
zoom = clamp(zoom + (mouse_wheel_down() - mouse_wheel_up())*0.05,0.05,0.4); 

var newzoom =clamp(zoom + start_zoom,0.05,0.4);
var view_w = lerp(camera_get_view_width(cam),iw*newzoom,zoom_speed); //zoom_speed = 0.25;
var view_h = lerp(camera_get_view_height(cam),ih*newzoom,zoom_speed); //lerp from old view height to display height

//Screenshake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,(shake_remain)-((1/shake_length))); //*shake_magnitude // shake magnitude increases when zooming out for consistency

camera_set_view_size(cam,view_w,view_h);
surface_resize(application_surface,iw,ih);
camera_set_view_pos(cam,x-view_w/2,y-view_h/2); //set new position to include screenshake and zoom position

#region //parallax background ඞ
/*
if (room != rMenu)
	{
	if (layer_exists("background1")) {		//close background
		layer_x("background1",x*0.98);	
		//layer_y("background1",camera_get_view_y(cam)*0.9); //change this dependant on zoom level
	}
	if (layer_exists("background2")) {
		layer_x("background2",x*1);	
		//layer_y("background2",camera_get_view_y(cam)*0.95);
	}
	if (layer_exists("background3")) {		//far background
		layer_x("background3",x*1);	
		//layer_y("background3",camera_get_view_y(cam)*0.95-40);
	}
}
*/	
#endregion
