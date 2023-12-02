/// @description Insert description here
// If live_call() is true, return live_result and end script
if (live_call()) return live_result;

	var displace_y = 15; 
    draw_sprite_pos(sprite_index, image_index,
        bbox_left + xVar,
        bbox_top + yVar - displace_y, 
        bbox_right + xVar,
        bbox_top + yVar - displace_y, 
        bbox_right,
        bbox_bottom + 1 - displace_y,
        bbox_left,
        bbox_bottom + 1 - displace_y,
        1);
		
//TO DO: move this to a function later 

// Fetch the weapon struct
var weapon_struct = global.weapon_list[current_weapon];
var col_text = make_color_rgb(202,210,210);

//draw the sprites
hover_timer += 0.02; //delta_time;
if hover_timer > 2 hover_timer = 0; //reset this after a while
var float_duration = 0.3;
var float_y = (1 + sin(hover_timer / float_duration)) / 2;
draw_sprite_ext(weapon_struct.sprite,0,x-10,y + float_y - 14,1,1,20,c_white,1);


// Check if the fetched weapon is a struct and contains weapon_name
if (is_struct(weapon_struct) && variable_struct_exists(weapon_struct, "weapon_name")) {
    var weapon_name = weapon_struct.weapon_name;
    var border = 2;	
	var text_x = x; // Center of the sprite
    var text_y = y - sprite_height / 2 - 30; // Above the sprite
	
	// Calculate the dimensions for the box
    var border = 2;
    var halfw = string_width(weapon_name) * 0.5 + border*2; // Half width of the text plus border
    var h = string_height(weapon_name) + border * 2;      // Height of the text plus top and bottom border
	
	
	if nearby {
		draw_sprite_ext(sMarker,0,x,y-54,1,1,0,c_white,1);	
		//draw 'e' icon here for pickupd
		
		// Draw the box
	    draw_set_color(c_black);
	    draw_set_alpha(0.4);
	    draw_roundrect_ext(text_x-halfw, text_y-h/2, text_x+halfw, text_y+h/2, 15, 15, false); // Adjusted y positions to center the box around text_y
		// Draw the weapon name
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle); // Center the text vertically
		draw_set_color(col_text);
		draw_set_alpha(1); 
	    draw_text(text_x+1, text_y, weapon_name);
		//draw_text(text_x+1, text_y-20, startAmmo);
	}
	
	
	//reset
	draw_set_valign(fa_top); // Center the text vertically
}
