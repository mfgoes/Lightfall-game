// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lights_begin(){
	
	
if (event_type == ev_draw) and (event_number == 0) {
	if (!surface_exists(iLight.light_surface)) {
		iLight.light_surface = surface_create(room_width, room_height);	
	}
	
	//var cam = view_camera[view_current];
	
	surface_set_target(iLight.light_surface);
	
	//camera_apply(cam);
	//try applying previous effect here
	
	//apply effect
	
	draw_clear_alpha(c_black,1);
	gpu_set_blendmode(bm_add); 
	
	//
	//set alpha
	draw_set_alpha(0.4) // 0.15
	draw_set_colour(c_white)
	draw_rectangle(0,0,room_width,room_height,false)
	draw_set_alpha(1)
	
	    // normally you draw this under the walls so they dont get blurred out, 
	    // if you do want walls hidden by the shadows add this line:
	    //draw_rectangle(wall.bbox_left,wall.bbox_top,wall.bbox_right,wall.bbox_bottom,false)
	};
}