// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GameMasterControls(){
	
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

	if keyboard_check_released(key_pause_menu) && room != rMenu && room != rLevelSelect //to do: make this more elegant
	{
		if !(global.game_paused)
		{
			if layer_exists("Player")
				pause_menu = instance_create_layer(0, 0, "Player", oMenuParent); //check if layer exists first
			else
				pause_menu = instance_create_depth(0, 0, depth-5, oMenuParent);
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
}
	
function GameLevelClear(){ 
	#region level cleared (move to function later)
	if room != rMenu {
	
	//check if there are enemies left
	if global.wavetotal - global.killsthiswave = 0 && global.wavetotal > 0 {
		if !instance_exists(oEnemyParent) && no_more_enemies = false {
			no_more_enemies = true;
			audio_play_sound(snLevelClear_Special_Click_05,0,0); //only play if there are waves to begin with
			//generate arrow object (points at portal)
			instance_create_depth(x,y,depth,oPortalArrow);
		}
	}
	}
	#endregion
}
	
function GameDebugTests() {
	if global.debugmode = true {

	//toggle between lighting
	
	//draw in separate function
	
	//spawning test enemies

	}
}