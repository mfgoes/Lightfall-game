/// @description Insert description here
// You can write your code in this editor
if (live_call()) return live_result; 
	draw_self(); 
	
if (global.debugmode) {
	draw_text(x,y-20,"falling:" + string(falling));
	draw_text(x,y-40,string(dir) + ", spd: " + string(spd));
}