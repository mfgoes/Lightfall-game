/// @description Insert description here


var xscale = camera_get_view_width(oCamera.cam)/display_get_width();
var yscale = camera_get_view_height(oCamera.cam)/display_get_height();
var vx = camera_get_view_x(oCamera.cam)// + camera_get_view_width/2;
var vy = camera_get_view_y(oCamera.cam) //+ camera_get_view_height/2;




//for debugging
draw_set_color(c_black);
draw_text(10,20,"xscale " + string(xscale));
draw_text(10,30,"vx " + string(vx));
draw_text(10,40,"vy " + string(vy));
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