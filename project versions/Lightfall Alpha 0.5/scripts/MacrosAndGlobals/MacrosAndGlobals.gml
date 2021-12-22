// Script assets have changed for v2.3.0 see
// init the very important macros and globals here
function MacrosAndGlobals(){

#region globals
	global.hasgun = true;
	global.kills = 0;
	global.killsthiswave = 0;
	global.wavetotal = 0;
	global.killsthisroom = 0;
	global.skipmenu = 0; 
	global.exp_points = 0;
	global.exp_points_thisroom = 0;
	global.debugmode = false; 
	global.game_paused = false;
	global.pause_bg = noone;
	global.sound_volume = 1;
	global.effects = true; //toggle for performance
	global.gamepad_on = false; //gamepad
	audio_master_gain(global.sound_volume);
#endregion

#region set up resolution macros MOVE THIS TO FUNCTION LATER
	#macro SAVEFILE "Save.sav"
	#macro RES_W 480	
	#macro RES_H 270
	#macro RES_SCALE 2 //how much to scale the pixel art
	#macro RES_RATIO RES_H/RES_W
	#macro CAM_SMOOTH 0.1
	#macro TILE_SIZE 16 
#endregion

#region particle system (move this elsewhere later)
	//create particle system
	global.partSystem = part_system_create();
	part_system_depth(global.partSystem, -100);
	pause_menu = noone;
#endregion
}