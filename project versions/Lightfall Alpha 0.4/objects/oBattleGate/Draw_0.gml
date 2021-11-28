/// @description 
draw_self();

draw_set_font(fSign);
draw_set_color(c_blue);
if touched_gate = true {
	draw_text(x,y-40,"active");}
else draw_text(x,y-40,"false");

draw_text(x,y-60,spawner); //should be same as neighbour. 

/*
draw_set_font(fSign);
draw_set_color(c_white);
draw_text(x,y-40,round(x)); 


if instance_exists(other_gate) {
	if other_gate.x > x {
		draw_set_alpha(0.4);
		draw_rectangle_color(x,y,other_gate.x,y-stack_num*sprite_height,col_debug,col_debug,col_debug,col_debug,0);
		draw_set_alpha(1);
	}

	draw_set_color(c_red);
	if secondary_gate = true draw_text(x,y-100,"gate 2");

	if connected = true {
		draw_circle(x,y-40,10,0);
	}

	draw_set_color(c_white);
}
*/