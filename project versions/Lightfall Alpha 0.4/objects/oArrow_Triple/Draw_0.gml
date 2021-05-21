/// @description Insert description here
//gm live 
if (live_call()) return live_result; 

//draw the attack laser section
//draw_sprite_general(sLaserbeam,0,0,0,60,5,x,y,1,1,direction,c_white,c_white,c_white,c_white,1);
draw_self();
if gun_flare > 0 {
	draw_sprite(sBullet,0,xstart+lengthdir_x(10,direction),ystart+lengthdir_y(10,direction));
	gun_flare-=1;
}