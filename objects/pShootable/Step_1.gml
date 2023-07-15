/// @description Insert description here
// You can write your code in this editor
if global.game_paused {
	exit;
}

if (hp <= 0)
	instance_destroy();

//This code allows objects to hit targets without having to be destroyed. 
timer_init("hitIDtimer"); 
if hitID != 0 && timer_get("hitIDtimer") <= 0 {
	timer_set("hitIDtimer",30); 
}
if timer_get("hitIDtimer") = 1 {
	hitID = 0;
}