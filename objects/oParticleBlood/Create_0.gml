/// @description Insert description here
particle_Blood = part_type_create();
var col1 = make_color_rgb(255,12,12);
wind_dir = 270; //

part_type_sprite(particle_Blood,sParticleSnow, 0, 0, 1); 
part_type_size(particle_Blood, 0.3, 1.3, 0, 0);
part_type_life(particle_Blood, 200, 600);
part_type_color2(particle_Blood, col1,c_white);
part_type_speed(particle_Blood, 0.3, 1, 0, 0.1); 
part_type_direction(particle_Blood, wind_dir-40, wind_dir+40, 0, 2);
part_type_alpha2(particle_Blood, 1, 0); 
//part_type_size(particle_Snow, 0.03, 0.12,-0.0003,0.001);
if instance_exists(oPlayer)
	part_particles_create(global.partSystem, oPlayer.x+random_range(-5,5), oPlayer.y, particle_Blood, 10);

alarm[0] = 35;
	


