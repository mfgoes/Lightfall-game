// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_UI_elements(){
	var margin_right = RES_W-96;
	var margin_bottom =  RES_H -35;
	var UIscale = 0.75; //set this to customizable variable later
		

	if (room != rMenu) && (instance_exists(oPlayer))
	{
		//draw player healthbar
		var hp = oPlayer.hp; var hp_max = oPlayer.hp_max; var healthUImax = 100; var healthUI = (hp/hp_max) * healthUImax;
		draw_set_color(make_colour_rgb(23, 23, 43)); //hp bgr
		draw_rectangle(10,margin_bottom+10,healthUImax,margin_bottom+20,0);
		draw_set_color(make_colour_rgb(166, 252, 219)); //hp fgr
		draw_rectangle(10,margin_bottom+10,healthUI,margin_bottom+20,0);
	
		//draw cooldowns
		draw_set_alpha(1); draw_set_color(c_white);
		draw_set_font(fSign);
		draw_sprite_ext(sCooldowns_Archer,0,margin_right-25,margin_bottom,UIscale,UIscale,0,c_gray,1);
		draw_sprite_ext(sCooldowns_Archer,3,margin_right+5,margin_bottom,UIscale,UIscale,0,c_gray,1);
		draw_sprite_ext(sCooldowns_Archer,2,margin_right+35,margin_bottom,UIscale,UIscale,0,c_gray,1);
		//draw_sprite_ext(sCooldowns_Archer,1,margin_right+65,margin_bottom,UIscale,UIscale,0,c_gray,1);
		draw_set_halign(fa_center);
		draw_text(margin_right-13,margin_bottom+4,oPlayer.primary_cooldown); 
		draw_text(margin_right+17,margin_bottom+4,oPlayer.secondary_cooldown); 
		draw_text(margin_right+47,margin_bottom+4,oPlayer.roll_cooldown); 
		//draw_text(margin_right+77,margin_bottom+4,oPlayer.roll_cooldown); 
	
		//draw tooltips (labels)
		draw_text(margin_right-13,margin_bottom+14,"LMB"); 
		draw_text(margin_right+17,margin_bottom+14,"RMB"); 
		draw_text(margin_right+47,margin_bottom+14,"F"); 
		//draw_text(margin_right+77,margin_bottom+14,"F"); 
		draw_set_halign(fa_left);
	
		//draw EXP + Kill counter
		if  (global.kills > 0) {
			killtextscale = max(killtextscale * 0.85, 1); 	
			draw_text_transformed(RES_W-10,15,string(global.kills) + " kills",killtextscale,killtextscale,0);
		}
		draw_text_transformed(RES_W-10,4,string(global.exp_points) + " exp",killtextscale,killtextscale,0);
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