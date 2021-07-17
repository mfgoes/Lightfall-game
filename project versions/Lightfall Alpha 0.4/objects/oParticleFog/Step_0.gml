/// @description Insert description here
// You can write your code in this editor
//gm live 
if (live_call()) return live_result;

var cam_width = camera_get_view_width(view_camera[0]);
var cam_height = camera_get_view_width(view_camera[0]);
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

//make amount be zoom dependant to prevent creating too many
//zoom = clamp(zoom + (mouse_wheel_down() - mouse_wheel_up())*0.05,0.05,0.4); 


var amount = 0; if random(oCamera.zoom) >= 0.025 && random(1) < 0.2 amount = 2;

	
//Create smoke particle
part_emitter_region(global.partSystem,emitter_Cloud,cam_x-200, cam_x + cam_width+200, cam_y+80, cam_y + cam_height, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(global.partSystem, emitter_Cloud, particle_Cloud, amount);  
