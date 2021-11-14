/// @description draw areas

if gate_left != 0 && gate_right != 0 {
	draw_set_alpha(0.3);
	draw_set_color(col_debug);
	draw_rectangle(gate_left.x+8,y+50,gate_right.x+8,y-50,0);
	draw_self();
}

draw_set_color(c_white); draw_set_alpha(1);

draw_set_font(fSign);
draw_set_color(c_red);
draw_text(x,y-40,"gates: " + string(x_pos1) + ", " + string(x_pos2));
draw_text(x,y-60,"guest: " + string(n_pos1) + ", " + string(n_pos2));
draw_text(x,y-20,"pair: " + string(shared_left));


if shared_gate = true {
	draw_circle(x+30,y-20,5,0);
	draw_set_color(c_yellow);
	if shared_right = true draw_circle(x+50,y-20,5,0);
	if shared_left = true draw_circle(x+70,y-20,5,0);
	draw_set_color(c_white);
}