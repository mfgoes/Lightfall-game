/// @description Update camera
var view_w = camera_get_view_width(cam);
var view_h = camera_get_view_height(cam); 

camera_set_view_target(cam,follow);


//Zoom
zoom = clamp(zoom+(mouse_wheel_down() - mouse_wheel_up())*0.05,0.05,0.6); 

var view_w = lerp(view_w,iw*zoom,0.2);
var view_h = lerp(view_h,ih*zoom,0.2);

camera_set_view_size(cam,view_w,view_h);
surface_resize(application_surface,iw,ih);

//Set view pos
camera_set_view_pos(cam,follow.x-view_w/2,follow.y-view_h/2); 


//Apply camera position
camera_set_view_pos(cam,
clamp(camera_get_view_x(cam),0,room_width-view_w),
clamp(camera_get_view_y(cam),0,room_height-view_h));

#region //parallax (basics)
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