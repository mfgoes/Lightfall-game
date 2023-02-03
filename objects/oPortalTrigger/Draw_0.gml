/// @description Insert description here
// You can write your code in this editor
draw_self();
if nearby draw_sprite_ext(sMarker,0,x,y-30+hover,1,1,0,c_white,1);

//draw hint if locked
if locked = true && show_hint = true {
	var text = "Defeat enemies to unlock"
	draw_text(x,y-50+hover,text);
}