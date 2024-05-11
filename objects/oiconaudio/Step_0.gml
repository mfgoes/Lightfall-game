/// @description button actions

//click
if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, id) {
	if global.music_volume > 0 {
		global.music_volume = 0;
		global.sound_volume = 0;
		image_index = 2;
	} else {
		global.music_volume = 0.1;
		global.sound_volume = 1;
		image_index = 0;
	}			
	audio_sound_pitch(snClickSocial,0.9)
	audio_sound_gain(snClickSocial,0.6,0);
	audio_play_sound(snClickSocial,5,0);
	
	
	//target Game object to assign new volume
	if instance_exists(oGame) {
		with(oGame) audio_sound_gain(current_track,global.music_volume,300);
	}
}

//hover
if position_meeting(mouse_x, mouse_y, id) {
	if image_index = 0 { //play sound
		image_index = 1;
	}
} else if image_index != 2 image_index = 0;