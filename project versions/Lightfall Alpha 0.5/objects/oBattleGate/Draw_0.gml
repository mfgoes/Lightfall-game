/// @description 
draw_self();

if global.debugmode = true {
	draw_set_font(fSign);
	draw_set_color(c_red);
	if touched_gate = true {
		draw_text(x,y-40,"touched");}
	else draw_text(x,y-40,"false");

}