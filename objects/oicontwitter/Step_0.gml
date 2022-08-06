/// @description button actions

//click
if mouse_check_button_released(mb_left) && position_meeting(mouse_x, mouse_y, id) {
	url_open_ext("https://twitter.com/MischaProjects","_blank");	
}

//hover
if position_meeting(mouse_x, mouse_y, id) {
	if image_index = img_start { //play sound
		audio_sound_gain(snClick,0.4,0);
		audio_play_sound(snClick,5,0);
	}
	image_index = 3;
} else image_index = img_start;