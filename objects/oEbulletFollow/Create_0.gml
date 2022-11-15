/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
alarm[0] = 150; //destroy
dir = direction; //we will split this up into x and y vectors later. 
spd = 0; 

target = id; if instance_exists(oPlayer) target = oPlayer; 	
x_new =  sign(target.x-x);
y_new =  sign(target.y-y);


//play shoot sound
var sound = snchamberabbey_shot_01;
audio_sound_pitch(sound,choose(0.8,0.9,1));
audio_sound_gain(sound,0.2,0);
audio_play_sound(sound,5,0);
audio_sound_pitch(sound,1);