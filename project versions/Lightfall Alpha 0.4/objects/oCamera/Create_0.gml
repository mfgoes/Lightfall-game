/// @description Set up Camera
//GMLive
//if (live_call()) return live_result; 

#region set up resolution macros MOVE THIS TO FUNCTION LATER
	#macro SAVEFILE "Save.sav"
	#macro RES_W display_get_width()/4 //480 //double on retina. T
	#macro RES_H display_get_height()/4 //270 
	#macro RES_SCALE 2 //how much to scale the pixel art
	#macro RES_RATIO RES_H/RES_W
	#macro CAM_SMOOTH 0.1
#endregion


//center window (test)
var display_width  = display_get_width();
var display_height = display_get_height();
var window_width = RES_W;
var window_height = RES_H;

//using this primarily for mac. May not be required in the future. 
window_set_position(display_width/2-RES_W,display_height/2-RES_H);

