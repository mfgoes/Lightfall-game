/// @desc weapon & charge animations

//if (live_call()) return live_result; 

#region setup + draw sprite
	//load weapon based on character
	Load_CharacterData(oPlayer.current_weapon);	
	//set facing direction
	if !(image_angle <= 90 or image_angle >= 270)
	flip_weapon = -1; else flip_weapon = 1; 
	//draw sprite
	draw_sprite_ext(sprite_index,image_index,x,y,1,flip_weapon,image_angle,c_white,image_alpha);
#endregion

#region weapon visibility
	if timer_get("weapon_display") <= 0 { // show/hide weapon
	image_alpha = 0;
	}
	else 
	image_alpha = 1;
#endregion

#region visual effects (ie charging)
	
	if oPlayer.current_weapon = 0 {
		//charging weapon animation
		if weapon_charge > 2 
		{
			var color_line = make_colour_rgb(53, 78, 76);
			gpu_set_blendmode(bm_add);
			draw_line_width_color(x,y,x+lengthdir_x(5+weapon_charge*4,image_angle),y+lengthdir_y(5+weapon_charge*4,image_angle),15,c_black,color_line);
			gpu_set_blendmode(bm_normal);
			image_index = 1;
		}	
	}
	else 
	{
		image_alpha = 1;
		image_index = 0; 
	}
#endregion
		
//debug
//draw_text(x,y,timer_get("weapon_display"));
draw_text(x,y-20,weapon_charge);