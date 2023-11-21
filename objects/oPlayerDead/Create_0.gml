/// @description Insert description here
// You can write your code in this editor
hsp = 3;
vsp = -2;
grv = 0.2;
done = 0;
image_index = 0;
image_speed = 0.8;
sprite_index = spriteDie;

alarm[0] = 90;
ScreenShake(1,20);
audio_play_sound(snd_button_confirm_bass,1,false);

var hurt_sound = choose(Realistic_Punch_2_1,Realistic_Punch_2_2,Realistic_Punch_2_3); 
audio_play_sound(hurt_sound,2,0,0.3,false);
//game_set_speed(40,gamespeed_fps); //this is way too dangerous for now

if instance_exists(oCamera) {
	//with(oCamera) follow = other.id;
}
