/// @description Insert description here
//if (live_call()) return live_result; 
//image_blend = make_colour_hsv(155, 225, 249);
draw_self();

if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}

if global.debugmode = true {
	draw_text(x,y-text_pos-30,hsp);
	draw_text(x,y-text_pos-20,"target " + string((sign(target.x - x))) + "hsp " + string( sign(hsp)) );
	draw_text(x,y-text_pos-40,"state " + string(current_state));
	draw_circle(x,y,sight_range,1);
}