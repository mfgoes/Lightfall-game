/// @description go towards player + reset bbox
spd = 6;
if instance_exists(oPlayer) {
	dir_facing =  point_direction(x,y,oPlayer.x,oPlayer.y-random(4));
}