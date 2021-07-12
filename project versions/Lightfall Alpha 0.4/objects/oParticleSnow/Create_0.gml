/// @description Insert description here
// You can write your code in this editor
//gm live 
if (live_call()) return live_result;

xStart = camera_get_view_x(view_camera[0]); 
yStart = camera_get_view_y(view_camera[0]); 

CameraWidth = camera_get_view_width(view_camera[0]);
CameraHeight = camera_get_view_height(view_camera[0]);

//


particle_Snow = part_type_create();
var col1 = make_color_rgb(255,236,243);
var col2 = make_color_rgb(157,100,83);

part_type_sprite(particle_Snow,sParticleSnow, 0, 0, 1); 
part_type_size(particle_Snow, 0.5, 1.5, 0, 0);
part_type_life(particle_Snow, 300, 500);
part_type_color2(particle_Snow, c_white,c_white);
part_type_speed(particle_Snow, 0.4, 0.6, 0, 0.1); 
part_type_direction(particle_Snow, 270, 290, 0, 0);
part_type_alpha2(particle_Snow, 1, 0); 
//part_type_size(particle_Snow, 0.03, 0.12,-0.0003,0.001);
part_type_blend(particle_Snow,false);
	
particle_SnowCloud = part_type_create(); 
emitterSnow = part_emitter_create(global.partSystem);
emitterSnowCloud = part_emitter_create(global.partSystem); 


//part_emitter_region(global.partSystem,emitterSnowCloud,xStart, xStart + CameraWidth, yStart, yStart + CameraHeight, ps_shape_rectangle, ps_distr_linear);
//part_emitter_stream(global.partSystem, emitterSnowCloud, particle_SnowCloud, 2);



