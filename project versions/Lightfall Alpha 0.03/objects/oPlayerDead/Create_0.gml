/// @description Insert description here
// You can write your code in this editor
hsp = 3;
vsp = -2;
grv = 0.2;
done = 0;
image_index = 0;
image_speed = 0;
sprite_index = spriteDie;

ScreenShake(3,50);
audio_play_sound(snDeath,10,false);
game_set_speed(40,gamespeed_fps);

with(oCamera) follow = other.id;
