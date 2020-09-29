/// @description Insert description here
#region //Debug Mode
if (debugmode) {	//check if in debug mode
	key_db_canrope = mouse_check_button_pressed(mb_right); //keyboard_check_pressed(ord("P")) //|| keyboard_check(
	
	if (key_db_canrope) 
	{
		canrope = !canrope;	//toggle rope
		audio_sound_gain(snClick,0.3,0);
		audio_play_sound(snClick,5,0);
	}
}
#endregion

//Player game input (KB / Mouse / Gamepad)
PlayerInput();

//Change player state
script_execute(state);	

//Collisions. Make more compact later + determine better when to call. 
PlayerCollision();
