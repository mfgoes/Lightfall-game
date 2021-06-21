/// @description Draw UI elements
//DRAW UI
draw_UI_elements();
draw_debug_info();

//if instance_exists(oPlayer) {
//	draw_set_color(c_lime);
//	draw_text(10,30,"slowmo: " + string(oPlayer.slowmotion) + " - + ");
//}

draw_set_color(c_white);

if (live_call()) return live_result;


if instance_exists(oEnemySpawnerParent) { //how should I check this?
	draw_set_font(fUI);
	draw_set_halign(fa_center);
	draw_set_color(c_black);
	draw_set_alpha(0.4);
	draw_rectangle(RES_W/2-60,10,RES_W/2+60,35,0);
	draw_set_alpha(1);
	
	draw_text_transformed(RES_W/2,16,string(global.wavetotal - global.killsthiswave) + " enemies left",killtextscale,killtextscale,0);
	draw_text_transformed(RES_W/2-1,15,string(global.wavetotal - global.killsthiswave) + " enemies left",killtextscale,killtextscale,0);
	draw_set_color(c_white);
	draw_text_transformed(RES_W/2,15,string(global.wavetotal - global.killsthiswave) + " enemies left",killtextscale,killtextscale,0);
}