/// @description Set up Camera

//set up resolution macros
#macro RES_W 960
#macro RES_H 560
#macro RES_SCALE 2
#macro RES_RATIO RES_H/RES_W
#macro CAM_SMOOTH 0.1

//Enable views
view_enabled = true;
view_visible[0] = true;
cam = camera_create_view(0,0,RES_W,RES_H); 
view_set_camera(0,cam);

//Resize window & applicatiom surface
window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE); 
surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);

display_set_gui_size(RES_W, RES_H);

//center window
var display_width  = display_get_width();
var display_height = display_get_height();
var window_width = RES_W * RES_SCALE;
var window_height = RES_H * RES_SCALE;
window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);

//"ideal width" -> Remove this later
iw = display_width;
ih = display_height;
zoom = 0.2;

//Mouse previous
mouse_x_previous = device_mouse_x_to_gui(0);
mouse_y_previous = device_mouse_y_to_gui(0);

//reincluded code
follow = oPlayer;
camera_set_view_target(cam,follow);

xTo = xstart;
yTo = ystart;
camDist = 0; //move to 90 later
camDistFoc = -200; //focused view
camDistFar = camDist;
camDistRaw = 0;
camFov = 0;
camFocused = false; //zoom is far away
camW = camera_get_view_width(cam);
camH = camera_get_view_height(cam); 


/// @description Set up Camera
cam = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(cam)*0.5;
view_h_half = camera_get_view_height(cam)*0.5;

xTo = xstart;
yTo = ystart;

shake_length = 60;
shake_magnitude = 6;
shake_remain = 6;
buff = 32;

