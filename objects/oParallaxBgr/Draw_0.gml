/// @desc draw parallax

//GMLive
if (live_call()) return live_result; 

var view_cam = view_camera[0]; 
//to do: remove magic numbers once I figure out how it works. 
var r_num = RES_W; 
var par_h = RES_H+30; //parallax 1 height (2nd layer) 
if bgr_parallax2 = bgr_hills par_h = RES_H; 



var vx1 = camera_get_view_x(oCamera.cam) + (camera_get_view_width(view_cam)/display_get_width());
var vx = camera_get_view_x(oCamera.cam) + ((r_num*camera_get_view_width(view_cam)*1.333)/display_get_width());
var vx2 =  camera_get_view_x(oCamera.cam) - (r_num*camera_get_view_width(view_cam)/display_get_width());
var vy = camera_get_view_y(oCamera.cam) - (300*camera_get_view_height(view_cam)/display_get_height()); 
var vy2 = camera_get_view_y(oCamera.cam) + (par_h*5.5*camera_get_view_height(view_cam)/display_get_height());

//scale based on zoom level (has bugs)
var res = 6;
var xscale = res*(camera_get_view_width(view_camera[0])/display_get_width());
var yscale =  res*(camera_get_view_height(view_camera[0])/display_get_height());

var xshiftcam = xscale*oCamera.x * 0.1;

//draw main background
draw_sprite_ext(bgr_sky,0, vx1,vy,xscale,yscale,0,c_white,1); 

//draw x2 for parallax (first layer) 
draw_sprite_ext(bgr_parallax2,0, vx2 - xshiftcam,vy2,xscale,yscale,0,c_white,1); 
draw_sprite_ext(bgr_parallax2,0, vx  - xshiftcam,vy2,xscale,yscale,0,c_white,1); 


/*
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
}
*/