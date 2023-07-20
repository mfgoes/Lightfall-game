/// @description show damage done to enemy
if place_meeting(x,y,object_index) { //shift a bit if overlapping
	x+=choose(-5,5);
}

value = 0;
start_shift = 0;
counter_type = 0; //blood. 1 = item. 2 = coin

col_start = make_color_rgb(132,37,41);
col_end =  make_color_rgb(243,255,237); //(156,158,180);
col_current = col_start; 
depth = -100;

if counter_type = 1 {
	col_end = c_white;
}