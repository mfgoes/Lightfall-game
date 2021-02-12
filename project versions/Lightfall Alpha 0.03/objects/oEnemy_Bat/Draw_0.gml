/// @description Insert description here
event_inherited();
  
if global.debugmode = 1 {
	draw_set_alpha(1);
	/*draw_circle(xstart,ystart,3,0);
	draw_circle(xstart,ystart,sight_range,1);
	draw_ellipse(xstart-sight_range-20,ystart-sight_range,xstart+sight_range+20,ystart+sight_range,1);
	*/
	draw_text(x,y-10,current_state);
}
