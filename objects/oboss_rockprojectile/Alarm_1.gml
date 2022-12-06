/// @description go towards player + reset bbox
spd = 6;
if instance_exists(oPlayer) {
	dir_new =  point_direction(x,y,oPlayer.x,oPlayer.y-random(4));
}