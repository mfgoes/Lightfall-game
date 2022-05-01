/// @description Insert description here
draw_self();
if gun_flare > 0 {
	draw_sprite(sBullet,0,xstart+lengthdir_x(10,direction),ystart+lengthdir_y(10,direction));
	gun_flare-=1;
}
