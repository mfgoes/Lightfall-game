/// @description Insert description here
// You can write your code in this editor
event_inherited();

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

if (global.debugmode) { //show assisting info
draw_set_color(c_orange);
draw_circle(x,y,sight_range,1);
draw_set_color(c_yellow);
draw_circle(x,y,atk_range+20,1);
draw_text(x,y-30,hsp); 
draw_text(x,y-50,"cliff " + string((!place_meeting(x+hsp*2,y+1,oWall) && !place_meeting(x+hsp*2,y+1,oParPlatform)))); 
draw_set_color(c_white);
}