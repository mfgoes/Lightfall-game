/// @description Insert description here
//gm live 
if (live_call()) return live_result; 

//image_blend = make_colour_hsv(155, 225, 249);
draw_self();

//draw_text(x-10,y-40,string(id));
draw_set_halign(fa_center);


//check nearest other enemy
var dd = instance_nth_nearest(x,y,oEnemyMelee,2); //also check if player is (almost) on ground before deciding to mvoe
var _pos_nearest_enemy = sign(dd.x - x); //negative = left, positive = right
var _pos_target = sign(target.x - x);
var _colliding = sign(_pos_nearest_enemy + _pos_target); //returns either 1 or 0. 
if distance_to_object(dd) > 14 _colliding = 0; //if closest enemy is far away, ignore

draw_text(x,y-text_pos,"colliding" + string(_colliding) + " dir" + string(sign(target.x - x)));
//draw_text(x,y-text_pos-10,"dir" ));

if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
} 