// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function musicscripts(){
	//ignore room checking for now. just straight up play a song. 	
	if !audio_is_playing(current_track) && !(DEV_MODE) { //if in developer mode, don't play music
		audio_sound_gain(current_track,global.music_volume,200);
		audio_play_sound(Beyond_the_Lows___The_Whole_Other,0,2);
	}
}