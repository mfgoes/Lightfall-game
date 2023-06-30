if global.game_paused
{
	exit;
}

	
if start_zoom > 0 start_zoom -= 0.0004; else start_zoom = 0;

	//Upate camera destination
	if follow != id //only move camera if there's an object to follow
	{
		/* //remove mouse following. to do: improve aim following later
		//while aiming, follow mouse position slightly
		var pan_distance_weapon = 3; if zoom <= 0.10 pan_distance_weapon = 3; //move camera when aiming?
		if (weapon_zoom !=0 && follow = oPlayer) {
			var pan_distance_weapon = clamp(point_distance(follow.x,follow.y,mouse_x,mouse_y),3,10); //max camera shift when focusing weapon
		}
		xTo = follow.x+lengthdir_x(pan_distance_weapon,point_direction(follow.x,follow.y,mouse_x,mouse_y)); //Follow point from A (followX) to B (mouseX). Lenghtdir should be a fraction of distance of mouse to follow.x
		yTo = follow.y+lengthdir_y(pan_distance_weapon,point_direction(follow.x,follow.y,mouse_x,mouse_y));
	
		if ((follow).object_index == oPlayerDead) {
			x = round(xTo);
			y = round(yTo);
		}
		*/
		xTo = follow.x; //Follow point from A (followX) to B (mouseX). Lenghtdir should be a fraction of distance of mouse to follow.x
		
		//GMLive
		if (live_call()) return live_result; 

		//set standard view to be slightly below player, unless aiming down
		yTo = follow.y-20; 
		if mouse_y >= follow.y+TILE_SIZE*3 yTo = follow.y; 
		
		if ((follow).object_index == oPlayerDead) {
			x = round(xTo);
			y = round(yTo);
		}
	
		x += (xTo - x) / cam_speed // / 4; //cam_speed;
		y += (yTo - y) / cam_speed*0.6 // / 2; //cam_speed; 
	
		//allow manual zooming only in debug mode 
		if (global.debugmode) {
			zoom = clamp(zoom + (mouse_wheel_down() - mouse_wheel_up())*0.025,zoom_min,zoom_max); 
		}
		//to do: add zooming based on items + weapons + special activities
		
		//restrict zoom amount
		if zoom < zoom_min zoom = zoom_min;
		if zoom > zoom_max zoom = zoom_max;
		var newzoom = zoom - start_zoom; //clamp(zoom + start_zoom,zoom_min,zoom_max); //make this adjustable.	
		
		//this enables proper zoom
		var view_w = lerp(camera_get_view_width(cam),iw*newzoom,zoom_speed); //zoom_speed = 0.25;
		var view_h = lerp(camera_get_view_height(cam),ih*newzoom,zoom_speed); //lerp from old view height to display height
		
		//go towards ideal zoom (for both HTML and desktop) -> This is a quick fix. Make this more dynamic in the future. 
		/*
		if view_h < 216 { //zoom out
			view_h = lerp(camera_get_view_height(cam),216, 0.1);
		}
		if view_w < 384 { //zoom out
			view_w = lerp(camera_get_view_width(cam),384, 0.1);
		}*/

		//Screenshake
		x += random_range(-shake_remain,shake_remain);
		y += random_range(-shake_remain,shake_remain);
		shake_remain = max(0,(shake_remain)-((1/shake_length))); //*shake_magnitude // shake magnitude increases when zooming out for consistency
		zoomshake_remain = max(0,(zoomshake_remain)-((1/zoomshake_remain)));
		
		camera_set_view_size(cam,view_w+zoomshake_remain,view_h+zoomshake_remain);
		surface_resize(application_surface,iw,ih);
		camera_set_view_pos(cam,x-view_w/2,y-view_h/2); //set new position to include screenshake and zoom position
	}
	else exit;


