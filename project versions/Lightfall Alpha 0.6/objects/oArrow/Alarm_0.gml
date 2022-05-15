/// @description Insert description here
// You can write your code in this editor
instance_create_depth(xstart+lengthdir_x(12,image_angle),ystart+lengthdir_y(12,image_angle),depth,oBowImpactEffect);
repeat(3) {
	dd = instance_create_depth(xstart+lengthdir_x(12,direction)+random_range(-4,4),ystart+lengthdir_y(12,direction)+random_range(-4,4),depth,oDust);
	dd.hsp*=0.3; dd.vsp*=0.3; dd.image_alpha = 0.5;
}