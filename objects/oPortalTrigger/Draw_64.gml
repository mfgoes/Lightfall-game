/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;

draw_set_font(fSign);
draw_set_halign(fa_left);
	
var col_bgr = make_color_rgb(26,28,42);
var col_bar = make_color_rgb(76,46,59); 
var col_text = make_color_rgb(255,250,196);
var text_portal = "Enter the portal";
var textX = 10; // X-coordinate of the text
var textY = display_get_gui_height()-30; 
if (nearby) {
	text_portal = "Hold E to open portal"
}

if locked = false {
	var textWidth = string_width(text_portal) + 10; // Add some padding to the text width
	// Draw the background
    draw_set_color(col_bgr);
    draw_rectangle(textX-2, textY-5, textX + textWidth, textY + 20, false);
	
	 // Calculate the fill width of the bar based on the timer
    var fillWidth = textWidth * (timer_counter / 60);
	 // Draw the bar
    draw_set_color(col_bar);
    if timer_counter > 0 
		draw_rectangle(textX-2, textY-5, textX + fillWidth, textY + 20, false);
	
	// Draw the text
	draw_set_color(col_text);
	draw_text(textX+5, textY,text_portal);	
}

draw_text(textX,textY-40,timer_counter); 