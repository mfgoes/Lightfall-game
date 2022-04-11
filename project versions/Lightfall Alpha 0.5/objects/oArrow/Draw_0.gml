/// @description Insert description here
// You can write your code in this editor

draw_self();
if gun_flare > 0 {
	draw_sprite(sBlueArrows,0,xstart+lengthdir_x(5,direction),ystart+lengthdir_y(5,direction));
	gun_flare-=1;
}