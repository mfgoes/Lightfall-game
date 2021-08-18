//score system
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
audio_master_gain(global.sound_volume);

//create particle system
global.partSystem = part_system_create();
part_system_depth(global.partSystem, -100);


killtextscale = 1;            
fps_reader = 0;
alarm[0] = 20; //read fps every few steps, not every step. 
image_alpha = 0;
pause_menu = noone;
no_more_enemies = false; //use this to trigger "level has ended" actions 



//generate objects / randomizer codes
instance_create_layer(x,y,"Enemies",oEnemySpawner);