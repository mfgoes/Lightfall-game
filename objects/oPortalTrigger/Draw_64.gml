/// @description Insert description here

// If live_call() is true, return live_result and end script
if (live_call()) return live_result;

// Set font and alignment
draw_set_font(fSign);
draw_set_halign(fa_left);

// Define colors
var col_bgr = make_color_rgb(22, 25, 27);
var col_bar = make_color_rgb(76, 46, 59);
var col_text = make_color_rgb(255, 250, 196);

// Text to display
var text_portal = "Enter the portal";
if (nearby) {
    text_portal = "Hold E to open portal";
}
// Get camera view
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var cam_w = camera_get_view_width(view_camera[0]);
var cam_h = camera_get_view_height(view_camera[0]);

// Convert object's room position to GUI position
var gui_x = (oPortalTrigger.x - cam_x) / cam_w * display_get_gui_width();
var gui_y = (oPortalTrigger.y - cam_y) / cam_h * display_get_gui_height();


// Determine the position to display the text based on the player's proximity to the portal
var targetTextX, targetTextY;


if (nearby) {
    // If player is nearby, display text at the top of the portal in GUI coordinates
	draw_set_halign(fa_center); 
  targetTextX = gui_x;
    targetTextY = gui_y - 60;
} else {
    // If player is not nearby, display text at the top right of the screen
	draw_set_halign(fa_left); 
    targetTextX = display_get_gui_width() - string_width(text_portal) - 10;
    targetTextY = 10;
}

// Calculate current position using lerp
textX = lerp(prevTextX, targetTextX, lerpFactor);
textY = lerp(prevTextY, targetTextY, lerpFactor);

if (!locked) {
    var textWidth = string_width(text_portal) + 10; // Add some padding to the text width
    
    var rectStartX, rectEndX;
    if (nearby) {
        rectStartX = textX - textWidth / 2;
        rectEndX = textX + textWidth / 2;
    } else {
        rectStartX = textX;
        rectEndX = textX + textWidth;
    }
	prevTextX = textX;
	prevTextY = textY;

    // Draw the background
    draw_set_color(col_bgr);
    draw_rectangle(rectStartX, textY-5, rectEndX, textY + 20, false);

    // Calculate the fill width of the bar based on the timer
    var fillWidth = textWidth * (timer_counter / open_timer);

    // Draw the bar if timer_counter > 0
    if (timer_counter > 0) {
        draw_set_color(col_bar);
        draw_rectangle(rectStartX, textY-5, rectStartX + fillWidth, textY + 20, false);
    }

    // Draw the text
    draw_set_color(col_text);
    if (nearby) {
        draw_text(textX, textY, text_portal); 
    } else {
        draw_text(textX + 5, textY, text_portal); // +5 for padding when not nearby
    }  
}

//reset font stuff
draw_set_halign(fa_left);