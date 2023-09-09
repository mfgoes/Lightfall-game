if (live_call()) return live_result;

// Define text
var social = "@misho_dev";
var str = "Thanks for playing the demo.\nFollow me on Twitter for updates! -Mischa";

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
var mainMessageX = (display_get_gui_width() - string_width(str)) / 2;

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
draw_rectangle(mainMessageX - padding, textY - 50 - padding, mainMessageX + string_width(str) + padding, textY + textHeight + padding, false);
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