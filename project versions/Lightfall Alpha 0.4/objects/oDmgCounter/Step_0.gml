/// @description Insert description here
if (live_call()) return live_result; 

timer_init("display_time");

if timer_get("display_time") <= 0 {
	timer_set("display_time",35); 
}

if timer_get("display_time") = 1 {
	instance_destroy();	
}