if (live_call()) return live_result;

// Define colors + font
var col_bgr = make_color_rgb(22, 25, 27);
var col_hover = make_color_rgb(220, 215, 156);
var col_text = make_color_rgb(255, 250, 196);
var font_pixel = font_m5x7;
var resolution = 2; 

// Positioning
var str = "Thanks for playing the demo.\nFollow me on Twitter for updates! -Mischa";
var textX = (display_get_gui_width()*resolution) / 2;
var textY = (display_get_gui_height()*resolution) / 2;

//hide if menu exists
if !instance_exists(oMenuParent) {
	display_set_gui_size(RES_W*resolution, RES_H*resolution); //text is twice the resolution
	draw_set_color(col_bgr);
	draw_rectangle(textX-120*resolution,textY-90*resolution,textX+120*resolution,textY-40*resolution,0);

	//Draw text
	draw_set_halign(fa_center);
	draw_set_color(col_text);
	draw_set_font(font_pixel);
	draw_text(textX, textY - 80*resolution, str);
}

display_set_gui_size(RES_W, RES_H); //text is twice the resolution

/*
// Define text
var social = "@misho_dev";


// Define colors
var col_bgr = make_color_rgb(22, 25, 27);
var col_hover = make_color_rgb(220, 215, 156);
var col_text = make_color_rgb(255, 250, 196);

// Get mouse coordinates in GUI space
var guiMouseX = device_mouse_x_to_gui(0);
var guiMouseY = device_mouse_y_to_gui(0);

// Calculate text dimensions and position
var textWidth = string_width(social);
var textHeight = string_height(social);
var textX = (display_get_gui_width() - textWidth) / 2;
var textY = (display_get_gui_height() - textHeight) / 2;

// Calculate the mainMessageX position
var mainMessageX = (display_get_gui_width()); 

// Check if mouse is hovering over the text
if (guiMouseX >= textX && guiMouseX <= textX + textWidth && guiMouseY >= textY && guiMouseY <= textY + textHeight) {
    draw_set_color(col_hover);
    
    // If mouse is clicked while hovering, open the Twitter link
    if (mouse_check_button_pressed(mb_left)) {
		audio_play_sound(snClick,0,0,0.5);
        url_open("https://twitter.com/" + string_delete(social, 1, 1)); // Removes "@" and appends the handle to the Twitter URL
    }
} else {
    draw_set_color(col_text);
}


// Draw the background rectangle
var padding = 10; // Adjust as needed
draw_set_color(col_bgr);
draw_set_alpha(0.8); 
//draw_rectangle(mainMessageX - padding, textY - 50 - padding, mainMessageX + string_width(str) + padding, textY + textHeight + padding, false);

draw_rectangle(20,0,100,100,0);

draw_set_alpha(1); 

// Draw the main message
draw_set_halign(fa_center); 
draw_set_color(col_text); // Ensure text color is set again after drawing the rectangle
draw_text(mainMessageX, textY - 50, str);

// If hovering over the social handle, change the color to col_hover, otherwise use col_text
if (guiMouseX >= textX && guiMouseX <= textX + textWidth && guiMouseY >= textY && guiMouseY <= textY + textHeight) {
    draw_set_color(col_hover);
    draw_text(textX, textY, social);
    
    // Draw a 2px thick rectangle for added emphasis
	
    draw_rectangle(textX, textY + textHeight + 2, textX + textWidth, textY + textHeight + 2.5, false);
} else {
    draw_set_color(col_text);
    draw_text(textX, textY, social);
}
*/