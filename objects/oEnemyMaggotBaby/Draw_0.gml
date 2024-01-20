//@desc draw sprite
// Maggot's Draw Event
//if (live_call()) return live_result;


// Save the current blend mode
var original_blendmode_src = gpu_get_blendmode_src();
var original_blendmode_dest = gpu_get_blendmode_dest();

// Restore the original blend mode
gpu_set_blendmode(bm_normal);
// Draw the original sprite
draw_sprite_ext(sprite_index, image_index, x + atk_anim_x, y, image_xscale, image_yscale, image_angle, c_white, 1);

// Set the blend mode for the tint overlay
gpu_set_blendmode (bm_add); // You can experiment with bm_add, bm_subtract, etc.

// Overlay with a semi-transparent brown tint
draw_sprite_ext(sprite_index, image_index, x + atk_anim_x, y, image_xscale, image_yscale, image_angle, color_add, 0.4);

// Restore the original blend mode
gpu_set_blendmode(bm_normal);

//flash when hit
effect_flash();

//debug
if (global.debugmode) {
	draw_set_color(c_red);
	draw_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_top,1);	
	draw_set_color(c_white);
}

