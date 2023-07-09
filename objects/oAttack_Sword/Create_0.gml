/// @description Insert description here
// You can write your code in this editor
dist = 30; //spread radius
duration = 35; //how long to do attack
damage = 4;
active_attack = 1;
alarm[0] = duration;
image_alpha = 1; 


#region Slash sound
	var audio = choose(Blunt_Swing_1_1,Blunt_Swing_1_2);
	audio_sound_gain(audio,choose(0.8,1),0);
	audio_play_sound(audio,2,0);
#endregion

//drama
ScreenShake(2, 1);
repeat(3) {
	var dd = instance_create_depth(x + lengthdir_x(10, image_angle) + random_range(-2, 2),
	y + lengthdir_y(10, image_angle) + random_range(-3, 3),
	depth - 1, oDust);
}