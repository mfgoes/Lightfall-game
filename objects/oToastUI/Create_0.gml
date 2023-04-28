/// @description Insert description here

str = "ERROR";
_x = x; 
_y = y; 
_xstart = xstart;  
_ystart = ystart;

alarm[0] = 1.5 * room_speed; 
alarm[1] = 20; //flash effect


enum variant
    {
        normal,
        damage, 
        error,
        tutorial 
    }
toast_type = variant.normal; 

