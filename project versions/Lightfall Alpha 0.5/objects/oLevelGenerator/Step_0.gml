/// @description adjust wind direction over time
timer_init("hold_pos");

if timer_get("hold_pos") <= 0 {

if grass_dir = 1 {
if grass_global_dir < 10 grass_global_dir +=0.2; else {
	grass_dir =-1; 
	timer_set("hold_pos",30); //freeze for a bit
	}
}
else if grass_dir = -1 {
	if grass_global_dir >= 0 grass_global_dir -=0.2; else {
		grass_dir =1; 
		timer_set("hold_pos",30); //freeze for a bit
	}
}
}