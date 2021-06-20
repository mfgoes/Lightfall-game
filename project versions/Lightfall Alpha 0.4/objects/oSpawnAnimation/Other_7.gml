/// @description Insert description here
// You can write your code in this editor

instance_create_depth(x,y,depth,spawn_type); //set spawn height later

instance_destroy();
audio_sound_gain(snSpawnGeneric,0.3,0);
audio_play_sound(snSpawnGeneric,0,0)
