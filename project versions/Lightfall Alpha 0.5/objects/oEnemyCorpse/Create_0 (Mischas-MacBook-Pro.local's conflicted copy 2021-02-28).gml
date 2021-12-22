/// @description Insert description here
// You can write your code in this editor
hsp = 3;
vsp = -2;
grv = 0.3;
done = 0;
start_color = c_white; //for recolored sprites
if image_number = 2 image_speed = 0; //if a 2 sprite death animation, change to last frame
image_speed = 1;
ScreenShake(2,5);
audio_sound_gain(snDeath,0.5,0);
audio_play_sound(snDeath,10,false);

