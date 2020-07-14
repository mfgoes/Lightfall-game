/// @description Update camera

//Update destination
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

//Update object position
x += (xTo - x) / 10;
y += (yTo - y) / 10;

x= clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y= clamp(y,view_h_half+buff,room_height-view_h_half-buff);

//Screenshake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//Update camera view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

//parallax (basics)		->Move to create event later for better performance

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