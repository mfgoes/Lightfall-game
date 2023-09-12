// Draw the sprite
draw_self();
if (live_call()) return live_result; 

if nearby draw_sprite_ext(sMarker,0,x,y-40,1,1,0,c_white,1);

// Fetch the weapon struct
var weapon_struct = global.weapon_list[current_weapon];

//setup text clors
var col_text = make_color_rgb(202,210,210);

// Check if the fetched weapon is a struct and contains weapon_name
if (is_struct(weapon_struct) && variable_struct_exists(weapon_struct, "weapon_name")) {
    var weapon_name = weapon_struct.weapon_name;
    var sprite = weapon_struct.sprite;
    var border = 2;	
	var text_x = x; // Center of the sprite
    var text_y = y - sprite_height / 2 - 10; // Above the sprite
	
	// Calculate the dimensions for the box
    var border = 2;
    var halfw = string_width(weapon_name) * 0.5 + border*2; // Half width of the text plus border
    var h = string_height(weapon_name) + border * 2;      // Height of the text plus top and bottom border
	
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
	
	//reset
	draw_set_valign(fa_top); // Center the text vertically
}
