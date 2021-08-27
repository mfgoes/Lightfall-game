// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_UI_elements(){
	
	//gm live 
	if (live_call()) return live_result; 

	var margin_right = RES_W-96;
	var margin_left = 30;
	var margin_bottom =  5;
	var UIscale = 0.75; //set this to customizable variable later

	//temp colors (fix these later
	var col_bgr = make_colour_rgb(22, 25, 27); //hp bgr; 
	var col_bgr2 = make_colour_rgb(55, 51, 52); //hp bgr
	var col_hp = make_colour_rgb(226, 178, 126); //hp fgr
	var col_exp = make_colour_rgb(178, 139, 120); //hp fgr

	if (room != rMenu) && (instance_exists(oPlayer))
	{
		//draw player healthbar
		var hp = oPlayer.hp; var hp_max = oPlayer.hp_max; var healthUImax = 100; 
		var healthUI = (hp/hp_max) * healthUImax - 1;
		draw_set_color(col_bgr);
		draw_rectangle(margin_left,margin_bottom,margin_left+healthUImax,margin_bottom+8,0);
		draw_set_color(col_hp);
		draw_rectangle(margin_left+1,margin_bottom+1,margin_left+healthUI,margin_bottom+7,0);
	
		//draw exp bar
		var expMax = 100;
		var expUI = global.exp_points * expMax;
		draw_set_color(col_bgr);
		draw_rectangle(margin_left,margin_bottom+10,margin_left+expMax,margin_bottom+13,0);
		draw_set_color(col_bgr2);
		draw_rectangle(margin_left+1,margin_bottom+11,margin_left+expMax,margin_bottom+12,0);
		draw_set_color(col_exp);
		draw_rectangle(margin_left+1,margin_bottom+11,margin_left+expMax*0.5,margin_bottom+12,0); //make this adjusta
		
		//draw profile
		draw_sprite_ext(sAvatar_archer,0,margin_left-18,margin_bottom,0.5,0.5,0,c_white,1);
		
		//draw cooldowns
		draw_set_alpha(1); draw_set_color(c_white);
		var w = sprite_get_width(sCooldown_Archer2) + 2;
		draw_sprite_ext(sCooldown_Archer2,0,margin_left,margin_bottom+15,1,1,0,c_white,1);
		draw_sprite_ext(sCooldown_Archer2,1,margin_left+w*1,margin_bottom+15,1,1,0,c_white,1);
		draw_sprite_ext(sCooldown_Archer2,2,margin_left+w*2,margin_bottom+15,1,1,0,c_white,1);
		
		/*
		//cooldown numbers
		draw_set_font(fSign);
		draw_set_halign(fa_center);
		draw_text(margin_left+5,margin_bottom+w,primary_cooldown); 
		draw_text(margin_left+w+5,margin_bottom+w,roll_cooldown); 
		//draw_text(margin_left+w*2,margin_bottom+w,roll_cooldown); 
		*/
	
		//draw tooltips (labels)
		/*
		draw_text(margin_right-13,margin_bottom+14,"LMB"); 
		draw_text(margin_right+17,margin_bottom+14,"RMB"); 
		draw_text(margin_right+47,margin_bottom+14,"F"); 
		
		draw_set_halign(fa_left);
		//draw EXP + Kill counter
		if  (global.kills > 0) {
			//killtextscale = lerp(killtextscale,2,0.5);
			draw_text_transformed(RES_W-10,15,string(global.kills) + " kills",killtextscale,killtextscale,0);
		}
		draw_text_transformed(RES_W-10,4,string(global.exp_points) + " exp",killtextscale,killtextscale,0);
		*/
		
	}
	#region draw cursor
		var cursor_scale = 1;
		var current_weapon = 1;
		var mx = (window_mouse_get_x()/window_get_width()) * display_get_gui_width();
		var my = (window_mouse_get_y()/window_get_height()) * display_get_gui_height();
	
		if instance_exists(oPlayer) current_weapon = oPlayer.current_weapon; //select image_index
		if instance_exists(oPlayerWeapon) {
			if oPlayerWeapon.weapon_charge = oPlayerWeapon.weapon_charge_max cursor_scale = 1.2;
		}
		draw_sprite_ext(sCrosshairs,current_weapon,mx,my,cursor_scale,cursor_scale,0,c_white,1);
	#endregion


	#region draw level instructions (ie enemies left)
		var color_text = make_color_rgb(254,231,97);
		var col_bgr = make_color_rgb(36,19,33);
		if (global.wavetotal - global.killsthiswave = 0) { 
			draw_sprite(sTexts_levelclear,0,RES_W/2,17); 
		}
		if (global.wavetotal - global.killsthiswave !=0) { 

			//outline (improve later)
			draw_set_font(font_UI);
			draw_set_halign(fa_center);
			draw_set_color(col_bgr);
			draw_set_alpha(1);

			draw_text_transformed(RES_W/2,16,string(global.wavetotal - global.killsthiswave) + " enemies left",killtextscale,killtextscale,0);
			draw_text_transformed(RES_W/2,18,string(global.wavetotal - global.killsthiswave) + " enemies left",killtextscale,killtextscale,0);
			draw_text_transformed(RES_W/2-1,17,string(global.wavetotal - global.killsthiswave) + " enemies left",killtextscale,killtextscale,0);
			draw_text_transformed(RES_W/2+1,17,string(global.wavetotal - global.killsthiswave) + " enemies left",killtextscale,killtextscale,0);
	
			draw_set_color(color_text);
			draw_text_transformed(RES_W/2,17,string(global.wavetotal - global.killsthiswave) + " enemies left",killtextscale,killtextscale,0);
			draw_set_color(c_white);
		}
	#endregion

}

function draw_debug_info(){
	var margin_right = RES_W-96;
	var margin_bottom =  RES_H -35;
	var UIscale = 0.75; //set this to customizable variable later
	
	if global.debugmode = true {
		//draw_text(10,4,"Lightfall Demo - Press R to restart");
		show_debug_overlay(true);
		draw_text(10,24,"zoom: " + string(oCamera.zoom));
		draw_text(10,40,"fps_reader: " + string(fps_reader));
	}
}