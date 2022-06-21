/// @desc draw parallax

//GMLive
//if (live_call()) return live_result; 

//bgrs
var background1 = sBgr_Sand1;
var background2 = sBgr_Sand2;
var background3 = bgr_hills;
var backgroundsky = bgr_dark_stars;

//init vars
var xscale = camera_get_view_width(view_camera[0])/display_get_width();
var yscale = camera_get_view_height(view_camera[0])/display_get_height();
var bgrsize = 5.5;
var vx = camera_get_view_x(oCamera.cam)// + camera_get_view_width/2;
var vy = camera_get_view_y(oCamera.cam) //+ camera_get_view_height/2;

var xshiftcam = xscale*oCamera.x;
var yshiftcam = yscale*oCamera.y + (yscale*-400);

var xshift = camera_get_view_x(view_camera[0]) + (xscale*800); //sprite_get_width(background1)*0.4;
var yshift = camera_get_view_y(view_camera[0])

//draw depending on BIOME (fix later)

draw_sprite_ext(backgroundsky,0, vx,vy,xscale*bgrsize,yscale*bgrsize,0,c_white,1); //moon / sky

//draw_sprite_ext(background3,0, xshift+xshiftcam*-0.2,yshift+100,xscale*bgrsize,yscale*bgrsize,0,c_white,1);

//draw_sprite_tiled_ext(background2,0, xshift+xshiftcam*-0.05,yshift,xscale*bgrsize,yscale*bgrsize,c_white,1);

//draw_sprite_tiled_ext(background1,0, xshift+xshiftcam*-0.2,yshift+yshiftcam*-0.1,xscale*bgrsize,yscale*bgrsize,c_white,1);
