/// @desc weapon & charge animations
#region //setup
	if (live_call()) return live_result; 
	sprite_index = oPlayer.character_weapons[0];
	draw_self();	
#endregion

//timers
#region //timers
	timer_init("weapon_display");	
	timer_init("weapon_putaway");
#endregion

//weapon animation
#region //weapon animation
	
	if timer_get("weapon_display") = -1 { // show/hide weapon
	image_alpha = weapon_active; //0 or 1	
	}
	
	if oPlayer.current_weapon = 0 {
		{
		
		
		//release bow
		if weapon_active = 1 {
			image_speed = 0;
			if weapon_charge < 2 {
			image_index = 0; 	
			} else {
				gpu_set_blendmode(bm_add);
				draw_line_width_color(x,y,x+lengthdir_x(5+weapon_charge*2,image_angle),y+lengthdir_y(5+weapon_charge*2,image_angle),2,c_black,c_blue);
				gpu_set_blendmode(bm_normal);
				image_index = 1;
			}	
		}
		if weapon_active = 0 && image_index != 5 {
			image_speed = 1; }
		if image_index = image_number-1 {image_speed = 0 image_index = image_number-1;}
		}
	}
#endregion

/*
//debug info
draw_text(x-30,y-30,weapon_active);
draw_text(x-30,y-6,timer_get("weapon_display"));

//draw frames
		if weapon_charge < 2 {
			image_index = 0; 	
		}
		else if weapon_charge > 2
		*/