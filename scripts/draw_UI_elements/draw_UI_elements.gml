// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_UI_elements(){
	
	if(live_call()) return live_result;

	var margin_right = RES_W-96;
	var margin_left = 30;
	var margin_bottom =  5;
	var UIscale = 0.75; //set this to customizable variable later

	//temp colors (fix these later
	var col_bgr = make_colour_rgb(22, 25, 27); //hp bgr; 
	var col_bgr2 = make_colour_rgb(55, 51, 52); //hp bgr
	var col_hp = make_colour_rgb(201, 53, 59); //hp fgr
	var col_exp = make_colour_rgb(66, 191, 255); //hp fgr

	if (room != rMenu) && (instance_exists(oPlayer))
	{
		#region health and mana bars
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
			draw_rectangle(margin_left+1,margin_bottom+11,margin_left+expMax*0.5,margin_bottom+12,0); //make this adjustable
		
			//draw profile
			draw_sprite_ext(sAvatar_archer,0,margin_left-18,margin_bottom,0.5,0.5,0,c_white,1);
		#endregion
		
		#region cooldowns
			//temporary variables
			draw_set_alpha(1); draw_set_color(c_white);
			var w = sprite_get_width(sCooldown_Archer2);
			var w5 = sprite_get_width(sCooldown_Archer2)+5; //sprite width + 5; (add some spacing
			var m5 = 5; //margin 5
			var p10 = 10; var pt5 = -4; var p15 = 20;
			var bar_max = 16; //size of load bar
			var time_c = 0.1 //time divider (for visual)
			//cooldown numbers
			draw_set_font(f_smooth);
			draw_set_halign(fa_center);
			
			//PRIMARY 
			var bar = (primary_cooldown/primary_cooldown_max)*bar_max
			draw_sprite_ext(sCooldown_Archer2,0,margin_left,margin_bottom+15,1,1,0,c_white,1);
			if round((primary_cooldown_max - primary_cooldown)*time_c) != 0 {
				draw_set_alpha(0.6);
				draw_rectangle_color(margin_left,p15+bar_max, margin_left+w-2,p15+bar,c_black,c_black,c_black,c_black,0);
				draw_rectangle_color(margin_left,p15+bar_max, margin_left+w-2,p15,c_black,c_black,c_black,c_black,0);
				draw_set_alpha(1);
				draw_text(margin_left+p10,w5+pt5,round((primary_cooldown_max - primary_cooldown)*time_c));
			}
			
			//SECONDARY
			var bar = (secondary_cooldown/secondary_cooldown_max)*bar_max
			draw_sprite_ext(sCooldown_Archer2,3,margin_left+w5*1,margin_bottom+15,1,1,0,c_white,1);
			if round((secondary_cooldown_max - secondary_cooldown)*time_c) > 0 {
				draw_set_alpha(0.6);
				draw_rectangle_color(margin_left+w5,p15+bar_max, margin_left+w5+w-2,p15+bar,c_black,c_black,c_black,c_black,0);
				draw_rectangle_color(margin_left+w5,p15+bar_max, margin_left+w5+w-2,p15,c_black,c_black,c_black,c_black,0);
				draw_set_alpha(1);
				draw_text(margin_left+w5+p10,w5+pt5,round((secondary_cooldown_max - secondary_cooldown)*time_c));
			}
			
			
			//THIRD
			var bar = (third_cooldown/third_cooldown_max)*bar_max
			draw_sprite_ext(sCooldown_Archer2,2,margin_left+w5*2,margin_bottom+15,1,1,0,c_white,1);
			if third_cooldown_max - third_cooldown != 0 {
				draw_set_alpha(0.5);
				draw_rectangle_color(margin_left+w5*2,p15+bar_max, margin_left+w5*2+w-2,p15+bar,c_black,c_black,c_black,c_black,0);
				draw_rectangle_color(margin_left+w5*2,p15+bar_max, margin_left+w5*2+w-2,p15,c_black,c_black,c_black,c_black,0);
				draw_set_alpha(1);
				draw_text(margin_left+w5*2+p10,w5+pt5,round((third_cooldown_max - third_cooldown)*time_c)); 
			}
			
			//FOURTH
			var bar = (roll_cooldown/roll_cooldown_max)*bar_max;
			draw_sprite_ext(sCooldown_Archer2,1,margin_left+w5*3,margin_bottom+15,1,1,0,c_white,1);
			if roll_cooldown_max - roll_cooldown != 0 {
				draw_set_alpha(0.5);
				draw_rectangle_color(margin_left+w5*3,p15+bar_max, margin_left+w5*3+w-2,p15,c_black,c_black,c_black,c_black,0);
				draw_rectangle_color(margin_left+w5*3,p15+bar_max, margin_left+w5*3+w-2,p15+bar,c_black,c_black,c_black,c_black,0);
				draw_set_alpha(1);
				draw_text(margin_left+w5*3+p10,w5+pt5,round((roll_cooldown_max - roll_cooldown)*time_c));
			}
			
		#endregion
	
		
		#region draw accessibility icons (control shortcuts)
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
		#endregion
	
	}

}

function draw_cursor_custom(){
		var cursor_scale = 0.75;
		var current_weapon = 1;
		var mx = (window_mouse_get_x()/window_get_width()) * display_get_gui_width();
		var my = (window_mouse_get_y()/window_get_height()) * display_get_gui_height();
		if instance_exists(oPlayer) current_weapon = oPlayer.current_weapon; //select image_index
		if global.HTML_config = 0 draw_sprite_ext(sCrosshairs,current_weapon,mx,my,cursor_scale,cursor_scale,0,c_white,1);
}
	
function draw_debug_info(){
	draw_set_font(fSign); 
	draw_set_color(c_white); 
	
	if global.debugmode = true { //&& instance_exists(oCamera)
		draw_set_halign(fa_right);
		draw_text(RES_W-12,40,"Rfps: " + string(fps_reader));
		draw_text(RES_W-12,60,"Gamefps: " + string(fps));
		draw_set_halign(fa_left);
		
		draw_text(4,60,"camW: " + string(camera_get_view_width(oCamera.cam)));
		draw_text(4,50,"camH: " + string(camera_get_view_height(oCamera.cam)));
		
	}
	else {
		//show_debug_overlay(true);
	}
	

}
	
function show_region_title(){
		
		var text_bgr = make_colour_rgb(22, 25, 27);
		var text_res_scale = 1.5;
		display_set_gui_size(RES_W*text_res_scale, RES_H*text_res_scale);
		draw_set_halign(fa_center);
		draw_set_font(fMenu);
		timer_init("fade_in");	
		timer_init("fade_out");
		
		if timer_get("fade_in") <= 0 {
			timer_set("fade_in",170); //fade in first
		}
		if timer_get("fade_in") = 1 {
			timer_set("fade_out",200); //if this timer is on, start fading out. 
		}
		
		if timer_get("fade_out") <= 0 && levelname_opacity < 1 levelname_opacity+=0.01; //if not fading out
		if timer_get("fade_out") > 0 && levelname_opacity > 0 levelname_opacity-=0.01; //fade out again
		draw_set_alpha(levelname_opacity);
		draw_set_color(text_bgr);
		draw_text(RES_W/2*text_res_scale,RES_H*text_res_scale*0.1,level_name);
		draw_set_alpha(1);
		//reset 
		display_set_gui_size(RES_W, RES_H);	
}

function draw_objective_UI(){
	
	//portal objectives
	if instance_exists(oLevelEnd) {

	display_set_gui_size(RES_W, RES_H);	
		var text_bgr = make_colour_rgb(22, 25, 27);
		var text_res_scale = 1;
		display_set_gui_size(RES_W*text_res_scale, RES_H*text_res_scale);
		draw_set_halign(fa_right);
		draw_set_font(f_smooth);
		draw_set_color(text_bgr);
	
		var text = "Find the Portal" 
		if oLevelEnd.boss_defeated = true { text = "Enter the Portal" }  
		else if oLevelEnd.boss_summon = true {text = "Defeat the Guardian";}
		else {text = "Find the Portal";}
		draw_text(RES_W*text_res_scale-10,5,text);
	}
	
	//battle gates objectives
	if instance_exists(oBattleGate) && global.wavetotal - global.killsthiswave > 0 {
		//draw_set_halign(fa_center);
		//draw_set_color(text_bgr);
		//draw_text(RES_W/2,20,"Enemies left: " + string(global.wavetotal - global.killsthiswave > 0));
	}

}

function draw_boss_UI(){
	
}



//UI SOUNDS 2022.1
function audio_ui_click() {
	audio_sound_gain(snd_button1,global.sound_volume,0);
	audio_play_sound(snd_button1,1,0);	
}