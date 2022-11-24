/// @description Insert description here
draw_self();

if global.debugmode = true {
	draw_set_color(c_white);
	draw_circle(x,y,dist,1);
}

draw_text(x,y-30,active_attack);