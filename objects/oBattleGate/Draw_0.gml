/// @description 
draw_self();

if global.debugmode = true {
	draw_set_font(fSign); draw_set_color(c_black);
	draw_text(x,y-40,"i: " + string(id)); 
	draw_text(x,y-20,"n: "+ string(other_gate));
	draw_text(x,y-0,"M: "+ string(move_dir));
}