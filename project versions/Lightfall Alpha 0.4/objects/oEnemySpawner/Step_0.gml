/// @desc spawn randomly (no gates)

//if spawning randomly (no gates)
if x_pos1 = 0 {
	if instance_exists(oPlayer) {
		x =  (round(oPlayer.x/32) * 32)+16;
		y = oPlayer.y - 70;
	}
	else {x = xstart; y = ystart;}

	if !(alarm[0]) {
		if spawn_amount > 0	alarm[0] = spawn_timer*0.5; //check if alarm has fired or not been set yet
	}

	//destroy spawner object
	if global.wavetotal - global.killsthiswave = 0 && alarm[1] = -1 {
		alarm[1] = room_speed*4;
	}
}

