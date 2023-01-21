/// @description Insert description here
event_inherited();
if (live_call()) return live_result;

#region showcase image thumbnail for the level
	var thumb_x = RES_W/2; //half of screen
	var thumb_y = 100; 
	
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