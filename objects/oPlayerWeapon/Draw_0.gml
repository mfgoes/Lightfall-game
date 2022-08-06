/// @desc weapon & charge animations



#region setup + draw sprite
	Load_CharacterData(oPlayer.current_weapon);	
	//set facing direction
	var facing_dir = oPlayer.facing_direction;
	var flip_weapon = dcos(oPlayer.facing_direction); 
	//draw sprite
	draw_sprite_ext(sprite_index,image_index,x,y,1,flip_weapon,facing_dir,c_white,image_alpha);
#endregion



#region weapon visibility
	if timer_get("weapon_display") <= 0 { // show/hide weapon
	image_alpha = 0;
	}
	else 
	image_alpha = 1;
#endregion

#region visual effects (ie charging)
//charging weapon animation
if weapon_charge > 2 
{
	var color_line = make_colour_rgb(53, 78, 76);
	gpu_set_blendmode(bm_add);
	draw_line_width_color(x,y,x+lengthdir_x(5+weapon_charge*4,facing_dir),y,15,c_black,color_line);
	gpu_set_blendmode(bm_normal);
	image_index = 1;
}	
if global.debugmode = true {
	draw_text(x,y-10,oPlayer.x - x);
	draw_text(x+30,y-10,oPlayer.y - y);
	draw_text(x,y-30,facing_dir);
}

#endregion
