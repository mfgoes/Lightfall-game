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

#region debug
	/*var opacity = 0.2;
	if global.debugmode = true {
		draw_set_font(fSign);
		//draw_text(x+10,y+20,"active: " + string(active));	
		//draw_text(x+10,y+40,"width: " + string( bbox_right + 1 - bbox_left )); 	
	
		if distance_to_object(oPlayer) < 50 {
			//draw_text(oPlayer.x,y+100,"active: " + string(active));	
			draw_set_halign(fa_top); draw_set_color(c_white);
			draw_text(oPlayer.x,y+120,"flagged: " + string(flagged));	
			draw_text(oPlayer.x,y+140,"enter room: " + string(enter_room));	
		}
	}*/
#endregion
