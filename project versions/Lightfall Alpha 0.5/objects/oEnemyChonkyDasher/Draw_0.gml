/// @description Insert description here
event_inherited(); 
//change color if attacking (placeholder)
image_blend = c_orange;
if timer_get("charge_timer") > 0 image_blend = c_red;
draw_self();
if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
} 

if global.debugmode = true {
//check nearest other enemy
draw_set_halign(fa_left);
//draw_text(x,y-text_pos,charge_timer);
draw_text(x,y-text_pos-30,"state " + string(current_state));
//draw_text(x,y-text_pos-10,"n " + string(timer_get("notice_player")));
draw_text(x,y-text_pos-10,"rush " + string(timer_get("start_bullrush")));
draw_text(x,y-text_pos-20,"hsp " + string(hsp));
//target_x

//draw charge cooldown
//draw hp
draw_set_color(c_orange)
if timer_get("charge_timer") = -1 
var barsize = 70; else barsize = timer_get("charge_timer");
draw_rectangle(x-10,y-10-2,x+barsize*0.5-10,y-13-2,0);
draw_set_color(c_white)

//draw ranges
draw_set_alpha(0.5);
draw_circle(x,y,sight_range,1);
draw_circle(x,y,atk_range,1);
draw_set_alpha(1);

}
