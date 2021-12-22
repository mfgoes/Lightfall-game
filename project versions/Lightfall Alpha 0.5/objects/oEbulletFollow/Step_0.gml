event_inherited();

//if (live_call()) return live_result;

timer_init("follow_player");
timer_init("poof_trail");
timer_init("poof_trail_close");

//follow player code
if timer_get("follow_player") <= 0 {
	timer_set("follow_player",30);
}

//poof 
if timer_get("poof_trail") <= 1 {
	dd = instance_create_depth(x,y,depth+1,oDust); dd.hsp = 0; dd.vsp = 0; dd.image_alpha = 1; dd.image_speed = 0.4;
	timer_set("poof_trail",8+choose(1,4));
}


if timer_get("follow_player") = 1 && instance_exists(oPlayer) {
	var plr_direction = (point_direction(x,y,oPlayer.x, oPlayer.y-5)) 
	direction = direction + ((direction-plr_direction)*0.05);
}	

//if current direction = 90 and aimed_direction = 0, set new_direction = 45
//90+0/2. Subtract 45 from current direction