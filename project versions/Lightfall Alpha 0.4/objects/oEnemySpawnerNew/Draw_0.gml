/// @description draw areas

if global.debugmode = true {
	if gate_left != 0 && gate_right != 0 {
		draw_set_alpha(0.2);
		draw_set_color(col_debug);
		draw_rectangle(gate_left.x+8,y+50,gate_right.x+8,y-50,0);
	}
	draw_set_color(c_white); draw_set_alpha(1);
}