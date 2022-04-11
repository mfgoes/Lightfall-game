/// @description draw areas
//draw_self();

if global.debugmode = true {
	if gate_left != 0 && gate_right != 0 {
		draw_set_alpha(0.2);
		draw_set_color(col_debug);
		draw_rectangle(gate_left.x+8,y+50,gate_right.x+8,y-50,0);
		draw_set_color(c_white); draw_set_alpha(1);
	
		draw_text(x,y+60,gate_left.id);
		draw_text(x+50,y+60,gate_right.id);
	}
}

/*
if gate_active = true {
	draw_text(x,y-40,"active");}
else draw_text(x,y-40,"false");
}
*/
