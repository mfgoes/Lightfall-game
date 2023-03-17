/// @description Insert description here
// You can write your code in this editor


if instance_exists(oCamera) {
cam = camera_get_active();
vx = camera_get_view_x(oCamera.cam) + camera_get_view_width(cam)/2;
vy = camera_get_view_y(oCamera.cam) + camera_get_view_height(cam)/2;
xscale = camera_get_view_width(cam)/display_get_width();
yscale = camera_get_view_height(cam)/display_get_height();
}

//draw the backgrounds (changeable) 
bgr_sky = bgr_dark_stars; //main bgr
bgr_parallax2 = bgr_hills; //first layer of aprallax 