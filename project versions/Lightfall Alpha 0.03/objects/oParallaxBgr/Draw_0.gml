//draw_sprite(sBgr_Sand2,0,0,20);

{
//GMLive
//if (live_call()) return live_result; 

//draw_text(camera_get_view_x(oCamera.cam)+20,camera_get_view_y(oCamera.cam)+100,xscale); 

//it seems the camera position is shifting when zooming. try to bypass this to maintain consistency in position. 

//GMLive
if (live_call()) return live_result; 
var xscale = camera_get_view_width(view_camera[0])/display_get_width();
var yscale = camera_get_view_height(view_camera[0])/display_get_height();
var background1 = sBgr_Sand1;
var xshift = 0;
var yshift = 0;
var bgrsize = 1;
var vx = camera_get_view_x(oCamera.cam)// + camera_get_view_width/2;
var vy = camera_get_view_y(oCamera.cam) //+ camera_get_view_height/2;

draw_sprite_ext(background1,0, camera_get_view_x(view_camera[0])+xshift,camera_get_view_y(view_camera[0])+yshift,xscale*bgrsize,yscale*bgrsize,0,c_white,1);



//draw_sprite_ext(background1,0,vx,vy,xscale,yscale,0,c_white,1);

}