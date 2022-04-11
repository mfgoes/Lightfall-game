/// @description Insert description here
// You can write your code in this editor

xStart = camera_get_view_x(view_camera[0]); 
yStart = camera_get_view_y(view_camera[0]); 

CameraWidth = camera_get_view_width(view_camera[0]);
CameraHeight = camera_get_view_height(view_camera[0]);

	//Blank emitter, region/space to use
//	emitterEmber = part_emitter_create(global.partSystem);	

emitter_Cloud = part_emitter_create(global.partSystem); 

	
//create smoke particle (move this somewhere else later)
particle_Cloud = part_type_create();
var col1 = make_color_rgb(255,236,243);
var col2 = make_color_rgb(157,100,83);
wind_dir = 40; //

part_type_shape(particle_Cloud,pt_shape_cloud);
part_type_size(particle_Cloud, 0.6, 2, 0, 0);
part_type_orientation(particle_Cloud,40,359,0.01,0.1,0);
part_type_life(particle_Cloud, 300, 700);
part_type_blend(particle_Cloud,1);
part_type_speed(particle_Cloud, 0.01, 0.072, 0.0001, 0); 
part_type_direction(particle_Cloud, 70, 100, 0, 0);
part_type_alpha3(particle_Cloud, 0.001, 0.04,0.001); 
part_type_color2(particle_Cloud,col1,col2);


