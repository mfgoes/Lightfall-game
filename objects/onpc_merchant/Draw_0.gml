if instance_exists(oPlayer) {
	image_xscale = sign(oPlayer.x - x);
}
draw_self();


if nearby draw_sprite_ext(sMarker,0,x,y-24,1,1,0,c_white,1);