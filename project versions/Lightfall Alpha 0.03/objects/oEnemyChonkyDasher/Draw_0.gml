/// @description Insert description here
//gm live 
if (live_call()) return live_result; 

image_blend = c_orange;
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
/*var dd = instance_nth_nearest(x,y,oEnemyMelee,2); //also check if player is (almost) on ground before deciding to mvoe
var _pos_nearest_enemy = sign(dd.x - x); //negative = left, positive = right
var _pos_target = sign(target.x - x);
var _colliding = sign(_pos_nearest_enemy + _pos_target); //returns either 1 or 0. 
if distance_to_object(dd) > 14 _colliding = 0; //if closest enemy is far away, ignore
*/

draw_set_halign(fa_center);
//draw_text(x,y-text_pos,charge_timer);
draw_text(x,y-text_pos-20,"state " + string(current_state) );
draw_text(x,y-text_pos-10,"charge dir " + string(bullrush_dir));
//draw_text(x,y-text_pos-30,string(oPlayer.bbox_bottom) + "y " + string(bbox_bottom));
//target_x

//draw charge cooldown
//draw hp
draw_set_color(c_orange)
draw_rectangle(x-10,y-10-2,x+hp*10-10,y-13-2,0);
draw_set_color(c_white)

//draw ranges
draw_set_alpha(0.5);
//draw_circle(x,y,sight_range,1);
//draw_circle(x,y,atk_range,1);
draw_set_alpha(1);

}
