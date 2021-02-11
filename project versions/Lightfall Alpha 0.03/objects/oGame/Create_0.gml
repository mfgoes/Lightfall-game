//score system
global.hasgun = true;
global.kills = 0;
global.killsthisroom = 0;
global.skipmenu = 0; 
global.exp_points = 0;
global.exp_points_thisroom = 0;
global.debugmode = true; 
global.game_paused = false;
global.pause_bg = noone;
global.sound_volume = 1;

audio_master_gain(global.sound_volume);

killtextscale = 1;            
fps_reader = 0;
alarm[0] = 20; //read fps every few steps, not every step. 

//create important objects
if !instance_exists(oCamera) {
	dd = instance_create_depth(0,0,depth,oCamera);
	dd.follow = oPlayer;
}
if !instance_exists(oTransition) {
	instance_create_depth(0,0,depth,oTransition);
}
pause_menu = noone;