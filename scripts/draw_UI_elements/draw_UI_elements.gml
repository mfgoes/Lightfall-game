
function draw_UI_elements(){
	draw_set_font(fSign);
	if (room != rMenu) && (instance_exists(oPlayer)) {
		draw_health_and_mana();
		draw_objective_UI(); 
		if (instance_exists(oPlayerWeapon))
			draw_weapon_UI();
	}
}

function draw_health_and_mana() {
	
	if (live_call()) return live_result; 
	//UI variables
	var hp = oPlayer.hp; var hp_max = oPlayer.hp_max; 
	var healthUImax = 120; 
	var res = 2; 
	var UI_top = 10;
	var UI_left = display_get_gui_width()/2-healthUImax/2; //dependent on the width of the health bar 
	var UI_bot = display_get_gui_height()*res/2-30; //for elements at the bottom
	var bar_size = 13; // sprite_get_height(sCooldowns_v3); //size of load bar
	var time_c = 0.1 //time divider (for visual)
	var margin_right = RES_W-96;
	var margin_left = 10;
	var margin_bottom =  5;
	var UIscale = 0.75; //set this to customizable variable later
	
	//temp colors (fix these later
	var col_bgr_bar = c_black; //make_colour_rgb(55, 51, 52); //hp bgr
	var col_hp = make_colour_rgb(139, 66, 96); //hp fgr
	var col_mana = make_colour_rgb(156, 158, 180); //hp fgr
	var col_text = make_colour_rgb(243, 255, 237); //hp fgr
	
	
	#region health and mana bars
		//draw player healthbar
		
		var healthUI = (hp/hp_max) * healthUImax - 1;
		var bar_h = 5; 
		draw_set_color(col_bgr_bar);
		draw_rectangle(UI_left,UI_bot,UI_left+healthUImax,UI_bot+bar_h,0);
		draw_set_color(col_hp);
		draw_rectangle(UI_left+1,UI_bot+1,UI_left+healthUI,UI_bot+bar_h-1,0);
	
		//draw mana bar
		var mana_max = oPlayer.mana_max;
		var pos_y = 7; var bar_h = 2; 
		var manaUI = (oPlayer.mana/oPlayer.mana_max) * healthUImax-1;
		draw_set_color(col_bgr_bar);
		draw_rectangle(UI_left,UI_bot+pos_y,UI_left+healthUImax,UI_bot+pos_y+bar_h,0);
		draw_set_color(col_mana);
		draw_rectangle(UI_left+1,UI_bot+pos_y+1,UI_left+manaUI,UI_bot+pos_y+bar_h-1,0); //make this adjustable			
	#endregion		

}
	
	
function draw_weapon_UI() {
	
	if (live_call()) return live_result; 
	
	//UI variables
	var UI_top = 10;
	var UI_left = 8;
	var res = 2; 
	var UI_bot = display_get_gui_height()*res/2-20; //for elements at the bottom
	var bar_size = 13; // sprite_get_height(sCooldowns_v3); //size of load bar
	var time_c = 0.1 //time divider (for visual)
	var col_text = make_colour_rgb(243, 255, 237); //hp fgr
	//UI variables (old)
	var margin_right = RES_W-96;
	var margin_left = 10;
	var margin_bottom =  0;
	var UIscale = 0.75; //set this to customizable variable later
	
	draw_set_alpha(1); draw_set_color(c_white);	
	
	//draw weapon icons
	if instance_exists(oPlayerWeapon) { //(is_struct(oPlayerWeapon.current_weapon))
		var weapon_struct = global.weapon_list[oPlayerWeapon.current_weapon];
		var weapon_name = weapon_struct.weapon_name;
		var mb = 18; 
		draw_sprite(weapon_icons_2023,weapon_struct.icon_image,UI_left,UI_bot-mb*2); //primary 
		draw_sprite(weapon_icons_2023,2,UI_left,UI_bot-mb*4); //secondary
		
		if (global.debugmode) draw_text(UI_left,UI_bot-15,"weapon name: " + string(weapon_struct.weapon_name));
	}
	
	//draw coins 
	var pos_x_text = 27;
	draw_sprite(icon_currency,0,UI_left+5,UI_bot); //primary 
	draw_set_alpha(0.3); 
	draw_rectangle_color(UI_left+pos_x_text-2,UI_bot+2,UI_left+pos_x_text+10,UI_bot+12,c_black,c_black,c_black,c_black,0);
	draw_set_alpha(1); 
	draw_set_color(col_text);
	
	//ammo count
	var res = 2; 
	var UI_top = 10;
	var UI_left = display_get_gui_width()/2; //dependent on the width of the health bar 
	var UI_bot = display_get_gui_height()*res/2-30; //for elements at the bottom
	
	//basic ammo
	var pos_y = 11; //relative to this cooldown
	var pos_x_text = 5; var pos_x = -15; 
	var bar = (reload_time/reload_time_max)*bar_size
	draw_sprite_ext(sCooldowns_v3,0,UI_left+pos_x,UI_bot+pos_y,1,1,0,c_white,1);
	draw_set_alpha(0.3); 
	draw_rectangle_color(UI_left+pos_x_text-2,UI_bot+pos_y+2,UI_left+pos_x_text+9,UI_bot+pos_y+12,c_black,c_black,c_black,c_black,0);
	draw_set_alpha(1); 
	draw_set_color(col_text); 
	draw_text(UI_left+pos_x_text,UI_bot+pos_y,oPlayerWeapon.ammo_basic); 
	
	//draw coins
	draw_text(38,UI_bot+pos_y,"0"); 
			
	if round((reload_time_max - reload_time)*time_c) != 0 {
		draw_set_alpha(0.3);
		draw_rectangle_color(UI_left+pos_x,UI_bot+bar_size+pos_y, UI_left+pos_x+bar_size,UI_bot+bar+pos_y,c_black,c_black,c_black,c_black,0);
		draw_set_alpha(1);
	}	
	
}	
	
	
function draw_cursor_custom(cursor_scale = 1){
		if cursor_scale > 1 cursor_scale-=0.1; //automatically make cursor smaller
		var mx = (window_mouse_get_x()/window_get_width()) * display_get_gui_width();
		var my = (window_mouse_get_y()/window_get_height()) * display_get_gui_height();
		if global.HTML_config = 0 draw_sprite_ext(sCrosshairs,1,mx,my,cursor_scale,cursor_scale,0,c_white,1);
}
	

function show_region_title(){
		
		var text_bgr = make_colour_rgb(22, 25, 27);
		var text_res_scale = 1.5;
		display_set_gui_size(RES_W*text_res_scale, RES_H*text_res_scale);
		draw_set_halign(fa_center);
		draw_set_font(fSign);
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

}

function draw_boss_UI(){
	
}

//UI SOUNDS 2022.1
function audio_ui_click(sound = snd_button1) { //if no input, play default UI sound. 
	var sound_play = sound; 
	if sound = 0 sound_play = snd_button1; //click through, going to next page. 
	if sound = 1 sound_play = snd_button2; //click between buttons/links	
	if sound = 2 sound_play = snd_button_confirm_bass; //click between buttons/links	
	
	//determine volume
	if sound = 1 audio_sound_gain(sound_play,0.3,0); else
	audio_sound_gain(sound_play,global.sound_volume*0.5,0);	
	
	audio_play_sound(sound_play,1,0);	
}