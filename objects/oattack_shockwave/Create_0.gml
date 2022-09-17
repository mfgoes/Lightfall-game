/// @description attack settings
dist = 60; //spread radius
duration = 45; //how long to do attack
alarm[0] = duration;
image_speed = 1;
depth = oPlayer.depth+10; //behind player


//start with loading sound
audio_sound_gain(MULT_m1_snipe_chargeUp_01,0.1,0);
audio_play_sound(MULT_m1_snipe_chargeUp_01,0,0)
sound2 = 0;
