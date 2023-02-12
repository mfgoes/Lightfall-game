/// @description Insert description here
// You can write your code in this editor
event_inherited();

//flicker
if hover < 1 && hover_dir = 1 {
	hover += choose(0.1,0.05);	
} else hover_dir = -1; 

if hover > 0 && hover_dir = -1 {
	hover -= choose(0.1,0.05);
} else hover_dir = 1; 

image_xscale = 0.6 + hover*0.1;
image_yscale = image_xscale; 