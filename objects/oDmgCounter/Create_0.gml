/// @description show damage done to enemy
if place_meeting(x,y,object_index) { //shift a bit if overlapping
	x+=choose(-5,5);
}

value = 0;
start_shift = 0;
col_text = c_red;
depth = -100;