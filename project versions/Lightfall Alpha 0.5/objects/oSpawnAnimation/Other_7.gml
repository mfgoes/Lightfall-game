/// @description Insert description here
// You can write your code in this editor

var spawned_enemy = instance_create_depth(x,y,depth,spawn_type); //set spawn height later
spawned_enemy.pre_spawned = false;

instance_destroy();
audio_sound_gain(snSpawnGeneric,0.3,0);
audio_play_sound(snSpawnGeneric,0,0)
