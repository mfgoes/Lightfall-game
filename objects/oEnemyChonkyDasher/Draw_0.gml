/// @description customise colour
event_inherited(); 
//change color if attacking (placeholder)
image_blend = c_orange;
if timer_get("charge_timer") > 0 image_blend = c_red;
draw_self();
effect_flash();

draw_text(x,y-20,hsp);
draw_text(x,y-40,"w_spd" + string(walk_spd));