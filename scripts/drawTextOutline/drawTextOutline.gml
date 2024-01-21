/// Draw Text with Outline
/// @param {string} text - The text to draw.
/// @param {integer} x - The x-coordinate of the text.
/// @param {integer} y - The y-coordinate of the text.
/// @param {font} font - The font to use.
/// @param {integer} resolution - The resolution multiplier for text scaling.
/// @param {color} outlineColor - The color of the text outline.
function drawTextOutline(text, x, y, font, resolution, outlineColor) {
    // Define a default outline color (midnight blue)
    var DEFAULT_OUTLINE_COLOR =  make_color_rgb(27, 29, 40); //midnight 70

    // Use the default outline color if none is provided
    outlineColor = argument_count > 5 ? outlineColor : DEFAULT_OUTLINE_COLOR;

    // Store the original draw color
    var originalColor = draw_get_color();
    
    // Set the font and alignment
    draw_set_font(font);
    draw_set_halign(fa_center);
    
    // Set the GUI size for text scaling
    display_set_gui_size(RES_W * resolution, RES_H * resolution);
    
    // Draw the text with an outline
    for (var dx = -2; dx <= 2; dx+=2) {
        for (var dy = -2; dy <= 2; dy+=2) {
            draw_set_color(outlineColor);
            draw_text(x + dx, y + dy, text);
        }
    }
    
    // Draw the actual text in the center
    draw_set_color(originalColor);
    draw_text(x, y, text);
    
    // Reset scaling resolution
    display_set_gui_size(RES_W, RES_H);
}

// Example usage
/*
var fnt = font_m5x7;
var resolution = 2;
var enemy_name = "Grok the Guardian";
drawTextOutline(enemy_name, x, y, fnt, resolution);
*/