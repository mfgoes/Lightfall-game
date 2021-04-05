/// @description controls
/// @desc Switch to Fullscreen	CRASHES GAME*
var key_debug		= ord("1");
var key_restart		= ord("R")
var key_fullscreen  = ord("F");
var key_pause_menu  = vk_escape;

if keyboard_check_released(key_debug)
	global.debugmode = !(global.debugmode); 

if keyboard_check_released(key_restart)
	SlideTransition(TRANS_MODE.RESTART);
	
if keyboard_check_released(key_fullscreen) && (keyboard_check(vk_control)) {
	window_set_fullscreen(!window_get_fullscreen()); }

if keyboard_check_released(key_pause_menu)
{
	if !(global.game_paused)
	{
		pause_menu = instance_create_layer(0, 0, "Player", oPauseMenu);
		/*with all
		{
			image_speed_previous = image_speed;
			image_speed = 0;
		}*/
		global.game_paused = true;
	}
	else
	{
		/*with all
		{
			image_speed = image_speed_previous;
		}*/
		display_set_gui_size(RES_W, RES_H);
		global.game_paused = false;
		instance_destroy(pause_menu);
	}
}

if global.game_paused
{
	/*with all
	{
		image_speed_previous = image_speed;
		image_speed = 0;
	}*/
}

