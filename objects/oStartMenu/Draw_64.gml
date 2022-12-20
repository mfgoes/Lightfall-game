/// @description Draw Menu

if(live_call()) return live_result;


//fix scaling issues
var pl_m = 40; //padding left
var x_mid = (RES_W*resolution)/2;

display_set_gui_size(RES_W*resolution, RES_H*resolution); //text is twice the resolution

draw_set_font(font_pixel);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var i = 0;
menu_x = pl_m;
menu_y = RES_H * RES_SCALE-260;
button_h = 50; //line height

#region buttons
	repeat(buttons) {
			//draw rectangle bgr
			if (menu_index == i) {
				draw_set_alpha(0.5);
				draw_set_color(c_black);
				draw_rectangle(0,menu_y+(button_h*i-12),menu_x+240,menu_y+(button_h*i+35),0);
				draw_set_alpha(1);
			}
		
			draw_set_color(col_regular);
			var txt = button[i];
	
			//draw text
			if (menu_index == i) { //active button
				draw_set_color(col_yellow);
				txt = string_insert(" ",txt, 0); 
			}	
			draw_text(menu_x,menu_y + button_h * i,txt);
			i++;
	}
#endregion

#region info box

	if(live_call()) return live_result;

	box_width = 280; //px
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(RES_W * resolution-pl_m,menu_y - pl_m,RES_W * resolution - box_width - pl_m,RES_H * resolution - 100,0);
	draw_set_alpha(1);
	//text
	draw_set_halign(fa_left);
	draw_set_color(col_yellow);
	draw_text(RES_W * resolution - box_width - pl_m/2,menu_y-16,"Dev updates - 2 Sep 2022");
	draw_set_color(col_regular);
	draw_set_font(f_compact_sans);
	draw_text(RES_W * resolution - box_width - pl_m/2,menu_y+24,
	"- Fixed major aiming bug \n(direction changed when hit)\n - Added enemy variety\n - Added aim assist \n - 500+ views on YouTube!" 
	);
	draw_set_font(fSign);
	

#endregion

display_set_gui_size(RES_W, RES_H); //reset
draw_cursor_custom(); 
