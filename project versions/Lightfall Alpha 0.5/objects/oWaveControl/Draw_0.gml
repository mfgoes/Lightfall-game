/// @description draw grid content
//check viewport (for performance) 

if (CheckInCamera())
{
	//draw floating icon
	direction+=0.03;
	var shift_y = cos(direction)*2;
	draw_sprite(sprite_index,0,x,y+shift_y);

	//debug
	draw_set_color(c_white);
	//draw_set_halign(fa_center);
	draw_text(x,y-30,string(spawn) + "");
	if wave_active = true draw_text(x,y-50,string(grid_y) + "y");
	
}