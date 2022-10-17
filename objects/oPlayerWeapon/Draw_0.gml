/// @desc weapon & charge animations

//debug
//test if closest object works
if(live_call()) return live_result;


if (global.debugmode) {

		var closest = instance_nearest(x,y,pShootable);
		if  closest != noone 
			var true_aim =  point_direction(x,y,closest.x,closest.y-12); else true_aim = 90; 
			
			
	draw_text(x,y-40,shoot_direction);
	draw_text(x,y-70,true_aim)
	
	
	
	var linecheck = cos(oPlayer.facing_direction)*assist_dist; 
	var closest = instance_nearest(x,y,pShootable);
	if closest != noone {
		if distance_to_object(closest) < assist_dist
		if sign(closest.x - x) = sign(cos(oPlayer.facing_direction)) && abs(closest.y - y) < 100 &&
		!collision_line(x,y-12,closest.x,closest.y-12,oWallParent,0,0)
		{
			//change colour to red if out of angle bound
			if angle_in_range = true draw_set_color(c_green); else draw_set_color(c_red);
			draw_line(x,y,closest.x,closest.y-10);
			
		}
	}
	
	
}

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
#endregion
