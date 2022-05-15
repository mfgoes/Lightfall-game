// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lights_begin(){
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
	gpu_set_blendmode(bm_normal); //add light to the darkness
	
	
	////
	////////try drawing shit here
	//if instance_exists(oLighting) {x = oLighting.x; y = oLighting.y;}
	if instance_exists(oPlayer) {
		x = oPlayer.x;
		y = oPlayer.y-4;
	}
	
	
		//draw_set_color(c_black)
		//draw_rectangle(0,0,room_width/2,room_height,0);
		
		draw_set_alpha(1);
		r = 230/2;
		draw_ellipse_color(x-r,y-r,x+r,y+r,c_white,c_black,0);
		draw_set_alpha(1); 
		
	// This is now the standard lighting I have done guides about before 
	var numberoflinesimdrawing = ds_stack_size(iLight.wallthatblock)
	var shadowsize = 1100
	
	draw_set_alpha(0.45); 
	for (i=0; i<numberoflinesimdrawing; i++) {
	    // draw_shadows
	    draw_set_colour(c_black)
		wall = ds_stack_pop(iLight.wallthatblock)
	
		 //draw_primitive_begin(pr_linestrip);
	    draw_primitive_begin(pr_trianglestrip);
	        draw_vertex(wall.bbox_left, wall.bbox_top);
	        var dir = point_direction(x,y,wall.bbox_left,wall.bbox_top)
	        draw_vertex(wall.x+lengthdir_x(shadowsize,dir), wall.y+lengthdir_y(shadowsize,dir));

	        draw_vertex(wall.bbox_left, wall.bbox_bottom);
	        var dir = point_direction(x,y,wall.bbox_left,wall.bbox_bottom)
	        draw_vertex(wall.x+lengthdir_x(shadowsize,dir), wall.y+lengthdir_y(shadowsize,dir));

	        draw_vertex(wall.bbox_right, wall.bbox_top);
	        var dir = point_direction(x,y,wall.bbox_right,wall.bbox_top)
	        draw_vertex(wall.x+lengthdir_x(shadowsize,dir), wall.y+lengthdir_y(shadowsize,dir));
 
	        draw_vertex(wall.bbox_right, wall.bbox_bottom);
	        var dir = point_direction(x,y,wall.bbox_right,wall.bbox_bottom)
	        draw_vertex(wall.x+lengthdir_x(shadowsize,dir), wall.y+lengthdir_y(shadowsize,dir));

	    draw_primitive_end()
	}
	
	//add another layer of light shine
	draw_set_alpha(0.5);
	draw_ellipse_color(x-r,y-r,x+r,y+r,c_white,c_black,0);
	draw_set_alpha(1); 
		
	//
	//set transparency 
	draw_set_alpha(0.6) // 0.7 //(make this editable in debug mode)
	draw_set_colour(c_white)
	draw_rectangle(0,0,room_width,room_height,false)
	draw_set_alpha(1)
	}
}