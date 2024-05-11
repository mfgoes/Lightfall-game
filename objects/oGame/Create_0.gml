/// @desc create main game objects here. 
//debugmode is also set through this object

MacrosAndGlobals();

current_fps = 60; // Start with the default value (60 FPS)
level_number = 0;
level_name = ""; 
time_started = 0; //for speedrunners, etc.

//setup font stuff (move later)
font_setup(); 


image_alpha = 0;

//delete duplicate of self
if instance_number(object_index) > 1 instance_destroy(); 

no_more_enemies = true; //set to false when enemies are detected
//if instance_number(object_index) > 1 instance_destroy(); 

//set music depending on rooms
current_track = music_FuturisticScienceDungeon;
musicscripts();

