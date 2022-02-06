/// @description Insert description here
// You can write your code in this editor
light_layer = layer_get_id("Lighting_glow");
light_surface = surface_create(room_width,room_height);

layer_script_begin(light_layer,lights_begin);
layer_script_end(light_layer,lights_end);