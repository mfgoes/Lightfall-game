/// @description character animations

//draw_set_color(c_white);
// Draw character sprite
var flip_image = sign(dcos(facing_direction)) * 0.9 + dcos(facing_direction) * 0.1;
if (flip_image == 0) flip_image = 1;
draw_sprite_ext(sprite_index, image_index, x, y, flip_image, 1, image_angle, c_white, 1);
effect_flash();

// Debug visual

if (global.debugmode) {
	var sprite_name = sprite_get_name(sprite_index); // Get the name of the current sprite
	var debug_text = "Sprite: " + string(sprite_name) + " Image Speed: " + string(image_speed);
	var debug_2 = "X to die" 
	draw_text(x, y - 40, debug_text);
	draw_text(x, y - 50, debug_2);
}