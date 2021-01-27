/// @description controls
/// @desc Switch to Fullscreen	CRASHES GAME*
var key_debug		= ord("1");
var key_restart		= ord("R")
var key_fullscreen  = ord("F");

if keyboard_check_released(key_debug)
	global.debugmode = !(global.debugmode); 

if keyboard_check_released(key_restart)
	SlideTransition(TRANS_MODE.RESTART);
	
if keyboard_check_released(key_fullscreen) && (keyboard_check(vk_control)) {
	window_set_fullscreen(!window_get_fullscreen()); }
