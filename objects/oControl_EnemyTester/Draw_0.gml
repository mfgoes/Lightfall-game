/// @description draw grid content
//check viewport (for performance) 

if (CheckInCamera()) && global.debugmode = true //&& global.debugmode = true
{
	//draw floating icon
	direction+=0.03;
	var shift_y = cos(direction)*2;
	draw_sprite(sprite_index,0,x,y+shift_y);

	//debug
	draw_set_color(c_white);
	draw_set_font(f_compact_sans);
	//draw_set_halign(fa_center);
	//var str = object_get_name(ds_grid_get(grid,0,0)); 
	//draw_text(x,y-30,string(str));
	if ds_grid_get(grid_wave,grid_x,0) = undefined  
		var name = 0; 
	else 
		var name = object_get_name(ds_grid_get(grid_wave,grid_x,0));
	
	draw_text(x,y-50,"< " + string(name) + " >");
	draw_text(x,y-70,grid_x);
}
