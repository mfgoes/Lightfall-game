// Script assets have changed for v2.3.0 see
// init the very important macros and globals here
function MacrosAndGlobals(){

#region globals
	//config different game modes (ie skip menu, god mode, debugmode, etc)
	if (os_browser == browser_not_a_browser) global.HTML_config = 0; else global.HTML_config = 1;
	
	//settings
	global.debugmode = false; 
	global.game_paused = false;
	global.pause_bg = noone;
	global.sound_volume = 1;
	global.music_volume = 0;
	global.effects = true; //toggle for performance
	global.gamepad_on = false; //gamepad
	//player
	global.player1_health = 10; global.player1_hp_max = 10;
	global.player1_mana = 5; global.player1_mana_max = 10; 
	
	global.hasgun = true;
	global.enemies_spawned = 0;
	global.kills = 0;
	global.killsthiswave = 0;
	global.wavetotal = 0;
	global.killsthisroom = 0;
	
	global.exp_points = 0;
	global.exp_points_thisroom = 0;
	audio_master_gain(global.sound_volume); //remove this later, better to split use 2 audio channels: Music and sound effects (and voice acting later)
#endregion

#region create save file at start of game, not after. 
	if !(file_exists(SAVEFILE)) {
		var file;
		file = file_text_open_write(SAVEFILE);
		file_text_write_real(file,global.player1_health);
		file_text_write_real(file,global.player1_mana);
		file_text_close(file);
	} 
#endregion





#region set up resolution macros MOVE THIS TO FUNCTION LATER
	#macro SAVEFILE "Save.sav"
	#macro RES_W 480	
	#macro RES_H 270
	#macro RES_SCALE 2 //how much to scale the pixel art
	#macro RES_RATIO RES_H/RES_W
	#macro CAM_SMOOTH 0.1
	#macro TILE_SIZE 16 
	
	//setup game environments (ie different devices or testing envirnoment)
	#macro DEV_MODE false
	#macro GAME_NOMENUS:DEV_MODE true
	//global.skip_menu = DEV_MODE;
	
#endregion

//Enable GMLive (live reloading)
#macro LIVE_UPDATE 1

#region particle system (move this elsewhere later)
	//create particle system
	//global.partSystem = part_system_create();
	//part_system_depth(global.partSystem, -100);
	pause_menu = noone;
#endregion
}