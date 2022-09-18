/// @description Insert description here
// You can write your code in this editor
//debug stuff

//camera_set_view_size(cam,view_w,view_h);
//		surface_resize(application_surface,iw,ih);
//		camera_set_view_pos(cam,x-view_w/2,y-view_h/2); //set new position to include screenshake and zoom position

if (global.debugmode) {
	var pad = 5;
	var newzoom = zoom - start_zoom; //clamp(zoom + start_zoom,zoom_min,zoom_max); //make this adjustable.	
		
	//this enables proper zoom
	var view_w = lerp(camera_get_view_width(cam),iw*newzoom,zoom_speed); //zoom_speed = 0.25;
	var view_h = lerp(camera_get_view_height(cam),ih*newzoom,zoom_speed); //lerp from old view height to display height

	draw_set_color(c_yellow);
	draw_set_alpha(0.5);
	draw_rectangle(x-view_w/2,y-view_h/2,x+view_w/2,y+view_h/2,1);

	draw_circle(x,y,10,1);
	draw_circle(x+view_w,y+view_h,100,1)
	draw_set_alpha(1);
}