//draw_self();

#region darkness for gradients
	g1.image_alpha = active/2; 
	g2.image_alpha = active/2;
#endregion

#region darkness
	if active = true fade = 1;
	else if fade > 0 && active = false fade -=0.1;
	draw_set_color(c_black);
	draw_set_alpha(fade); var m = 400; 
	draw_rectangle(bbox_left-m,bbox_top,bbox_left,bbox_bottom,0);
	draw_rectangle(bbox_right+m,bbox_top,bbox_right,bbox_bottom,0);
	draw_rectangle(bbox_left-m,bbox_top,bbox_right+m,bbox_top-m,0);
	draw_rectangle(bbox_left-m,bbox_bottom,bbox_right+m,bbox_bottom+m,0);
	
	if active = false {
		draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
	}
	draw_set_alpha(1);
#endregion