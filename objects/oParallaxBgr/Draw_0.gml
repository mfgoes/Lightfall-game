/// @desc draw parallax

//GMLive
if (live_call()) return live_result; 


//bgrs
var background1 = bgr_sand_night;
var background2 = bgr_sand_night;
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
var yshift = camera_get_view_y(view_camera[0]) * (yscale*1) //this should be dependent on the zoom level. 

//draw depending on BIOME (fix later)

draw_sprite_ext(backgroundsky,0, vx,vy,xscale*bgrsize,yscale*bgrsize,0,c_white,1); //moon / sky


var x_width = sprite_get_width(background3);


//make y position responsive to zoom level (improve this later)
var y_margin = 100; if oCamera.zoom >= 0.5 y_margin = 150;

//backgrounds for level 1 and 2
if room = rLevel1 or room = rLevel2 {
	//setup basic backgrounds
	draw_sprite_ext(background3,0, xshift+xshiftcam*-0.1,yscale+y_margin,1,1,0,c_white,1);
	draw_sprite_ext(background3,0, xshift+xshiftcam*-0.1 + x_width,yscale+y_margin,1,1,0,c_white,1);

	//var bgr_choose = background2; 
	//var x_width = sprite_get_width(bgr_choose);
	//draw_sprite_ext(bgr_choose,0, xshift+xshiftcam*-0.2,yscale+y_margin+100,1,1,0,c_white,1);
	//draw_sprite_ext(bgr_choose,0, xshift+xshiftcam*-0.2 + x_width,yscale+y_margin+100,1,1,0,c_white,1);
}
//background for level 3
if room = rLevel3 {
	
	draw_sprite_ext(background3,0, xshift+xshiftcam*-0.1,yshift+y_margin,1,1,0,c_white,1);
	draw_sprite_ext(background3,0, xshift+xshiftcam*-0.1 + x_width,yshift+y_margin,1,1,0,c_white,1);
	
	//var bgr_choose = background1; 
	//var x_width = sprite_get_width(bgr_choose);
	//draw_sprite_ext(bgr_choose,0, xshift+xshiftcam*-0.3,yshift+y_margin+80,1,1,0,c_white,1);
	//draw_sprite_ext(bgr_choose,0, xshift+xshiftcam*-0.3 + x_width,yshift+y_margin+80,1,1,0,c_white,1);
}

//draw_sprite_tiled_ext(background3,0, xshift+xshiftcam*-0.05,yshift,xscale*bgrsize,yscale*bgrsize,c_white,1);
//draw_sprite_tiled_ext(background1,0, xshift+xshiftcam*-0.2,yshift+yshiftcam*-0.1,xscale*bgrsize,yscale*bgrsize,c_white,1);
