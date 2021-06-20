/// @description for debug follow player
if instance_exists(oPlayer) {
	x =  (round(oPlayer.x/32) * 32)+16;
	y = oPlayer.y - 70;
}
else {x = xstart; y = ystart;}