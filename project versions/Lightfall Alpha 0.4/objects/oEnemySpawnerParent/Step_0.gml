/// @description for debug follow player
if instance_exists(oPlayer) {
	x =  (round(oPlayer.x/32) * 32)+16;
	y = oPlayer.y - 70;
}
else {x = xstart; y = ystart;}

if !(alarm[0]) {
	if spawn_amount > 0	alarm[0] = spawn_timer*0.5; //check if alarm has fired or not been set yet
}