/// @description attack settings
dist = 60; //spread radius
duration = 45; //how long to do attack
damage = 10;
alarm[0] = duration;
image_speed = 1;
depth = oPlayer.depth+10; //behind player

oPlayer.can_move = false;	//can't move while attacking
oPlayer.hsp = 0; //stop player from moving
oPlayer.vsp = 0;

//start with loading sound
audio_sound_gain(MULT_m1_snipe_chargeUp_01,0.3,0);
audio_play_sound(MULT_m1_snipe_chargeUp_01,0,0)
sound2 = 0;
