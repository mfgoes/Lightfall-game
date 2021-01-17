/// @description Set up Camera
#region set up resolution macros
	#macro RES_W 480	
	#macro RES_H 270
	#macro RES_SCALE 2 //how much to scale the pixel art
	#macro RES_RATIO RES_H/RES_W
	#macro CAM_SMOOTH 0.1
#endregion

#region setup view basics
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
	//Mouse previous
	mouse_x_previous = device_mouse_x_to_gui(0);
	mouse_y_previous = device_mouse_y_to_gui(0);
#endregion

//reincluded code
if instance_exists(oPlayer) follow = oPlayer;
else follow = self;
camera_set_view_target(cam,follow);

//Starting camera position (room start)
if (instance_exists(follow)) {
	x = follow.x; y = follow.y; 
}
alarm[0] = 30; //replace with timer later

//cam_speed = 5;
zoom_speed = 0.5;
start_zoom = -0.05; //zoom level at start of level
zoom = 0.2; //zoom level adjusted through scroll
weapon_zoom = 0; //zoom level affected by weapon


#region camera setup variables (lessen later)
	xTo = xstart;
	yTo = ystart;
	camDist = 0; //move to 90 later
	camDistFoc = -200; //focused view
	camDistFar = camDist;
	camDistRaw = 0;
	camFov = 0;
	//camFocused = false; //allow switching between zoom in + zoom out later
	camW = camera_get_view_width(cam);
	camH = camera_get_view_height(cam); 


	/// @description Set up Camera
	cam = view_camera[0];
	view_w_half = camera_get_view_width(cam)*0.5;
	view_h_half = camera_get_view_height(cam)*0.5;

	//screenshake
	shake_length = 0;
	shake_magnitude = 6;
	shake_remain = 2;
	buff = 32; //??? remove this if possible
#endregion