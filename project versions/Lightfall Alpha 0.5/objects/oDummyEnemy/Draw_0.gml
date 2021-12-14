/// @description Insert description here
event_inherited();

//gm live 
//if (live_call()) return live_result;

if hp<hp_max { 
	//draw healthbar
	var percentagehp = (hp / hp_max)*20; // 0/0 = -5 1/2 = 5;  2/2 = 10; (multiplied by 10?)
	var bgrcolor = make_colour_rgb(27, 29, 40);
	var red1 = make_colour_rgb(173, 46, 51);
	draw_set_color(bgrcolor);
	draw_set_alpha(0.9);
	draw_rectangle(x-10,y-22,x+10,y-20,0);
	draw_set_alpha(1);
	draw_set_color(red1);
	draw_rectangle(x-10,y-22,x+percentagehp-10,y-20,0);
	draw_set_color(c_white);
}