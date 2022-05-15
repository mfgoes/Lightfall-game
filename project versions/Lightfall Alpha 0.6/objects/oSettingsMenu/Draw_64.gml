event_inherited(); 
display_set_gui_size(RES_W*resolution, RES_H*resolution);

var col = col_font; 
var xx = display_get_gui_width()/2;
var yy = -100;
BL_hover = false;
BR_hover = false; 

//hover effect arrows
if menu_move = 0 {
	m = lerp(m, 105, 0.3); 
	
//draw colission boxes
draw_rectangle(BL.bbox_left,BL.bbox_top,BL.bbox_right,BL.bbox_bottom,1);

draw_rectangle(BR.bbox_left,BR.bbox_top,BR.bbox_right,BR.bbox_bottom,1);
}
else m = lerp(m, 95, 0.3); 

//hover rectangle left // -> Replace with collision button
if(point_in_rectangle(device_mouse_x_to_gui(0),  device_mouse_y_to_gui(0), 
   BL.bbox_left, BL.bbox_top, BL.bbox_right, BL.bbox_bottom)) 
{
	draw_set_alpha(0.4);
	draw_rectangle(BL.bbox_left,BL.bbox_top,BL.bbox_right,BL.bbox_bottom,0);
	BL_hover = true;
}
//hover rectangle right
if(point_in_rectangle(device_mouse_x_to_gui(0),  device_mouse_y_to_gui(0), 
   BR.bbox_left, BR.bbox_top, BR.bbox_right, BR.bbox_bottom)) 
{
	draw_set_alpha(0.4);
	draw_rectangle(BR.bbox_left,BR.bbox_top,BR.bbox_right,BR.bbox_bottom,0);
	BR_hover = true;
}

//draw arrows
var yy = menu_y_top * resolution + (line_height*0); //verify yy check
draw_set_halign(fa_center);
draw_set_font(fMenu);
draw_set_color(col);
draw_set_alpha(1);

draw_text(xx-m,yy,"<");	
draw_text(xx+m,yy,">");	


//reset
display_set_gui_size(RES_W, RES_H); //text is twice the resolution

//debug 
if global.debugmode = true {
	draw_set_font(fSign);
	if BL_hover = true {
		draw_text(100,100,"BL Hover"); 	
	}
	if BR_hover = true {
		draw_text(100,100,"BR Hover"); 	
	}

}


