/// @description draw rope + player
draw_set_color(c_white);
if (state == PlayerStateSwing) draw_line_width(grappleX,grappleY,ropeX,ropeY,2);
draw_self();

//flash when hit
if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
} 

