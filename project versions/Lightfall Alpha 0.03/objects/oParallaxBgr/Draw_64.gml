/// @description Insert description here


var xscale = camera_get_view_width(oCamera.cam)/display_get_width();
var yscale = camera_get_view_height(oCamera.cam)/display_get_height();

//for debugging
draw_set_color(c_black);
draw_text(40,100,"xscale " + string(xscale));
draw_set_color(c_white);

/*
vx = camera_get_view_x(oCamera.cam)// + camera_get_view_width/2;
vy = camera_get_view_y(oCamera.cam) //+ camera_get_view_height/2;
xscale = camera_get_view_width(oCamera.cam)/display_get_width();
yscale = camera_get_view_height(oCamera.cam)/display_get_height();


vx = camera_get_view_x(oCamera.cam) + camera_get_view_width/2;
vy = camera_get_view_y(oCamera.cam) + camera_get_view_height/2;
xscale = camera_get_view_width(oCamera.cam)/display_get_width();
yscale = camera_get_view_height(oCamera.cam)/display_get_height();
*/