/// @description Insert description here
timer_init("text_time");
timer_init("text_yshift");
timer_init("text_color_change");

if timer_get("text_time") <= 0 {
	timer_set("text_time",45); 
}

if timer_get("text_time") = 1 {
	instance_destroy();	
}

if timer_get("text_color_change") <= 0 {
	timer_set("text_color_change",6); 
}
if timer_get("text_color_change") = 1 {
	col_current = col_end;
}

if timer_get("text_yshift") <= 0 {
	timer_set("text_yshift",10); 
}

if timer_get("text_yshift") = 1 {
	start_shift = 1;
}

if start_shift = 1 {
	y-=0.2;
}

