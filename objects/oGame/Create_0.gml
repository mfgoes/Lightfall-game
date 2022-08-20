/// @description MacrosAndGlobals
MacrosAndGlobals();


image_alpha = 0;

//delete duplicate of self
if instance_number(object_index) > 1 instance_destroy(); 

no_more_enemies = true; //set to false when enemies are detected
//if instance_number(object_index) > 1 instance_destroy(); 

//set music depending on rooms
current_track = Beyond_the_Lows___The_Whole_Other;
musicscripts();

