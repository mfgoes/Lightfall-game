/// @description Insert description here
// You can write your code in this editor
x+=hsp;
y+=vsp;

hsp *= 0.9;
vsp *= 0.9;

//move to player
timer_init("move_to_player");	
if timer_get("move_to_player") = -1 && speed = 0 {
	timer_set("move_to_player",20);
}

if !instance_exists(oPlayer) instance_destroy(); 
else
{
if timer_get("move_to_player") = 0 {
	speed = 3+round(random(2));
}
direction = point_direction(x,y,oPlayer.x,oPlayer.y);
speed+=0.01;

if place_meeting(x,y,oPlayer) {
	audio_sound_gain(snEquip,0.2,0);
	audio_play_sound(snEquip,0,0);
	repeat(random_range(1,3)) 
		with (instance_create_layer(x+lengthdir_x(5,direction)-5+random(10),y+lengthdir_y(5,direction)+random(10),"Bullets",oDust))
		 {
			image_xscale = 0.6; image_yscale = image_xscale;	
			image_speed = 1.5; 
			image_alpha = 0.4;
			hsp = 0;
			vsp = 0;
		}
		instance_destroy();
		global.exp_points +=1; //shared exp for now. Switch later if needed.
}
}