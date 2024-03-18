/// @description Insert description here
// Create a new tilemap layer
//if (live_call()) return live_result;
event_inherited();


if global.debugmode = true {
	if instance_exists(oPlayer) {
		draw_set_color(c_red);
		if abs(target.x-x) < detect_range && abs(target.y-y) < 20 draw_set_color(c_yellow);
		draw_rectangle(x-detect_range,y-5,x+detect_range,y+5,1);
		draw_set_color(c_white);
	}
}

	