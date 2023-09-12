/// @description Insert description here

str = "ERROR";
_x = x; 
_y = y+20; 
_xstart = xstart;  
_ystart = ystart;

alarm[0] = 1.5 * room_speed;  //destroy
alarm[1] = 20; //flash effect
alarm[2] = 2; //update timers

col_bgr = make_color_rgb(22, 25, 27);
col_hover = make_color_rgb(220, 215, 156);
col_text = make_color_rgb(202,210,210);

enum variant
    {
        normal, //small
        damage, //red flash effect
		upgrade, //ie pickups
        h1,   //big text
        h2 //mid text
    }
toast_type = variant.normal; 


