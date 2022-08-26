if global.game_paused
{
	exit;
}

	
if start_zoom > 0 start_zoom -= 0.0004; else start_zoom = 0;

	//Upate camera destination
	if follow != id //only move camera if there's an object to follow
	{
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
	
		//x = clamp(x,view_w_half+buff,room_width-view_w_half - buff); //maintain room boundaries buff = extra space for screenshake
		//y = clamp(y,view_h_half+buff,room_height-view_h_half - buff);
		x += (xTo - x) / cam_speed // / 4; //cam_speed;
		y += (yTo - y) / cam_speed*0.6 // / 2; //cam_speed; 
	
		
		
	
		//new zoom code utilizing weapon zoom
		zoom = clamp(zoom + (mouse_wheel_down() - mouse_wheel_up())*0.025,zoom_min,zoom_max); 
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
		
		//this fixes the camera (no zoom effects)
		//var view_w = camera_get_view_width(cam);
		//var view_h = camera_get_view_height(cam);
		
		//var view_w = lerp(camera_get_view_width(cam),iw*newzoom,zoom_speed); //zoom_speed = 0.25;
		//var view_h = lerp(camera_get_view_height(cam),ih*newzoom,zoom_speed); //lerp from old view height to display height

		//Screenshake
		x += random_range(-shake_remain,shake_remain);
		y += random_range(-shake_remain,shake_remain);
		shake_remain = max(0,(shake_remain)-((1/shake_length))); //*shake_magnitude // shake magnitude increases when zooming out for consistency

		camera_set_view_size(cam,view_w,view_h);
		surface_resize(application_surface,iw,ih);
		camera_set_view_pos(cam,x-view_w/2,y-view_h/2); //set new position to include screenshake and zoom position
		
		#region sticky zone areas (cancelled for Alpha version
		/*
			var mh = 140;  //padding for cameras pushes player inwards.
			var mv = 100;   //mh = margin horizontal, mv = margin vertical
	
			if active_zone = true && x1 != 0 { //if zone is properly set
				if lerp_q < 1 lerp_q += 0.02; //in future only trigger this after X time
				x_new = clamp(x,x1+mh,x2-mh);
				y_new = clamp(y,y1+mv,y2-mv);
				y = lerp(y,y_new,lerp_q);
				x = lerp(x,x_new,lerp_q);		
			} 
			else {
				x_new = round(follow.x); 
				y_new = round(follow.y);	 
				lerp_q = 0.3;
				x = lerp(x,x_new,lerp_q);
				y = lerp(y,y_new,lerp_q);
		
			}
		*/
		#endregion
	}
	else exit;
/*
#region determine collision with zone
	//if place_meeting(follow.x,follow.y,oCamZone) active_zone = true; else active_zone = false; //this should be decided by oCamZone
	if collision_rectangle(x1,y1,x2,y2,follow,0,0) {
		active_zone = true;
	}
	else active_zone = false;
#endregion
*/
	

