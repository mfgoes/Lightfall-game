/// @description Insert description here
// You can write your code in this editor

switch(wave_unlock) {
	case(0):
		color = c_white;
		break;
	case(1):
		color = c_green;
		break;
	case(2):
		color = c_blue;
		break;

}

draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,color,1)
draw_set_color(c_white);

if global.debugmode = true {
	draw_text(x,y,"wave: " + string(oWaveSystem.current_wave)); 
	draw_text(x,y+20,"wave required: " + string(wave_unlock)); 
}