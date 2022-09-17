/// @description animation flow
timer_init("particles_start");
timer_init("sound2"); 

if timer_get("sound2") < 0
	timer_set("sound2",15);

if sound2 = 0 && timer_get("sound2") = 0 {
	audio_play_sound(snDartGun1,0,0);
	sound2 = 1;
}