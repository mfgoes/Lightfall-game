//Upate camera destination
if (instance_exists(follow)) 
{
	xTo = follow.x;
	yTo = follow.y;
	
	if ((follow).object_index == oPlayerDead)
	{
		x = xTo;
		y = yTo;
	}
}
x= clamp(x,view_w_half+buff,room_width-view_w_half-buff); //maintain room boundaries
y= clamp(y,view_h_half+buff,room_height-view_h_half-buff);

x += (xTo - x) / 10;
y += (yTo - y) / 10;

//Zoom + recenter camera
zoom = clamp(zoom+(mouse_wheel_down() - mouse_wheel_up())*0.05,0.05,0.6); 
var view_w = lerp(camera_get_view_width(cam),iw*zoom,0.2); //lerp from old view width to display width
var view_h = lerp(camera_get_view_height(cam),ih*zoom,0.2); //lerp from old view height to display height

//Screenshake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,(shake_remain)-((1/shake_length)*shake_magnitude)); //shake magnitude increases when zooming out for consistency

camera_set_view_size(cam,view_w,view_h);
surface_resize(application_surface,iw,ih);
camera_set_view_pos(cam,x-view_w/2,y-view_h/2); //set new position to include screenshake and zoom position

#region //parallax scrolling background
if (room != rMenu)
	{
	if (layer_exists("bgr_mountains"))
	
	{
		layer_x("bgr_mountains",x/2);	
	}
	
	if (layer_exists("bgr_forests"))
	{
		layer_x("bgr_forests",x/4);	
	}
}
#endregion
