/// @description Insert description here
event_inherited();
if (live_call()) return live_result;

#region showcase image thumbnail for the level
	var thumb_x = RES_W/2; //half of screen
	var y_flow = cos(direction)*3; direction+=0.03; 
	var thumb_y = 80 + y_flow; 
	
	//switch to cases later: best times
	draw_sprite(best_time_placeholder,0,thumb_x,thumb_y+sprite_get_height(thumbnail_level)+5);
	
	switch(menu_move) {
		case 0: 
			draw_sprite(thumbnail_level,0,thumb_x,thumb_y);
			break;
		case 1: 
			draw_sprite(thumbnail_level,0,thumb_x,thumb_y);
			break;
		case 2: 
			draw_sprite(thumbnail_level,2,thumb_x,thumb_y);
			break;
		case 3: 
			draw_sprite(thumbnail_level,3,thumb_x,thumb_y);
			break;
		case 4: 
			draw_sprite(thumbnail_level,4,thumb_x,thumb_y);
			break;
		case 5: 
			draw_sprite(thumbnail_level,4,thumb_x,thumb_y);
			break;

	}	
#endregion