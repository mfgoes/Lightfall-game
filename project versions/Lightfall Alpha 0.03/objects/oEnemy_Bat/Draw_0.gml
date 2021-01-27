/// @description Insert description here
draw_self();
if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}   
 
  
if global.debugmode = 1 {
	draw_set_alpha(1);
	draw_circle(xstart,ystart,3,0);
	draw_circle(xstart,ystart,sight_range,1);
	draw_ellipse(xstart-sight_range-20,ystart-sight_range,xstart+sight_range+20,ystart+sight_range,1);

	/*draw_set_alpha(1);
	draw_set_color(c_blue);
	draw_circle(x,y,5,0);
	draw_set_color(c_red);
	draw_circle(targetx,targety,5,0);
	draw_set_color(c_white);*/
}
