wallthatblock = ds_stack_create() // we keep a list of all walls in this
light_layer = layer_get_id("Lights"); //double check for a layer later. 

surfaceblur = surface_create(room_width, room_height); // surface drawing the POV light map
surfacewhatyoucansee = surface_create(room_width, room_height); // the mask of what the player can see

light_surface = surface_create(room_width, room_height); // surface drawing the spotlight map

//draw basic shapes, then apply blendmode
//layer_script_begin(light_layer,scr_lightFOV_blackwhite);

//begin drawing surface

layer_script_begin(light_layer,scr_lights_begin);

//draw the lights here (also using begin) 

//reset surface target
layer_script_end(light_layer,scr_lights_end);

