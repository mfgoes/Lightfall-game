/// @description Insert description here
// You can write your code in this editor
hsp = 3;
vsp = -2;
grv = 0.2;
done = 0;
image_index = 0;
image_speed = 0.4;
sprite_index = spriteDie;

alarm[0] = 20;
ScreenShake(1,20);
audio_play_sound(Realistic_Punch_2_1,10,false);
//game_set_speed(40,gamespeed_fps); //this is way too dangerous for now

with(oCamera) follow = other.id;
