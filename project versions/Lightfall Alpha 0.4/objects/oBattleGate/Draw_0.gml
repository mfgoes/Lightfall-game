/// @description 
draw_self();
draw_set_font(fSign);

draw_set_color(c_red);
if other_gate.x > x draw_text(x,y-20,"left gate");
else draw_text(x,y-20,"right gate");
draw_set_color(c_black);
draw_text(x,y-40,touched_gate); 

