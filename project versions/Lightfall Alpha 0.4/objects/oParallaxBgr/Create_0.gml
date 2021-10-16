/// @description Insert description here
// You can write your code in this editor
cam = camera_get_active();

vx = camera_get_view_x(oCamera.cam) + camera_get_view_width/2;
vy = camera_get_view_y(oCamera.cam) + camera_get_view_height/2;
xscale = camera_get_view_width(cam)/display_get_width();
yscale = camera_get_view_height(cam)/display_get_height();

depth = layer_get_depth(layer_get_id("parallax_bgr")); 