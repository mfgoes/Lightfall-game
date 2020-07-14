/// @description draw rope + player
draw_set_color(c_white);
if (state == pState.swing) draw_line_width(grappleX,grappleY,ropeX,ropeY,2);
draw_self();
