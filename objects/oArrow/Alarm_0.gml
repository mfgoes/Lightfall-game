/// @description Insert description here
// You can write your code in this editor
if(live_call()) return live_result;
instance_create_depth(xstart+lengthdir_x(12,image_angle),ystart+lengthdir_y(12,image_angle),depth,oBowImpactEffect);
repeat(3) {
	var fx_dir = 90 + random_range(-5,5); //direction + random_range(-3,3); 
	var fx_spd = 1;
	
	dd = instance_create_depth(xstart+lengthdir_x(0,direction)+random_range(-4,4),ystart+lengthdir_y(0,direction)+random_range(-2,2),depth,oDust);
	dd.hsp = lengthdir_x(fx_spd, fx_dir);
	dd.vsp = lengthdir_y(fx_spd, fx_dir);
	dd.image_alpha = choose(0.3,0.5,0.8);
	dd.image_xscale = 0.6; 
	dd.image_yscale = 0.6;
	}
