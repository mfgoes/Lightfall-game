/// @description Insert description here

str = "ERROR";
_x = x; 
_y = y+20; 
_xstart = xstart;  
_ystart = ystart;

alarm[0] = 1.5 * room_speed; 
alarm[1] = 20; //flash effect


enum variant
    {
        normal, //small
        damage, //red flash effect
		upgrade, //yellow flash effect
        h1,   //big text
        h2 //mid text
    }
toast_type = variant.normal; 

