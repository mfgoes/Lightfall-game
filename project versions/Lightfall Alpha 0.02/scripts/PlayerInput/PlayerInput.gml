// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerInput(){
	if (hascontrol)
	{
		key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
		key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
		key_jump = keyboard_check_pressed(vk_space) //|| keyboard_check(ord("W"))
		key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
		key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
		key_roll =  keyboard_check_pressed(ord("F")) || keyboard_check_pressed(vk_shift); 

		if (key_left) || (key_right) || (key_jump)
		{
			controller = 0;	
		}

		if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
		{
			key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));	
			key_right = max(gamepad_axis_value(0,gp_axislh),0);
			controller = 1;
		}

		if (gamepad_button_check_pressed(0,gp_face1))
		{
			key_jump = 1;                          
			controller = 1;
		}
	
		if (key_roll) //enter roll state
			{
				if state = PlayerStateFree && roll_cooldown = 0{
					state = PlayerStateRoll;
					audio_play_sound(snLanding,4,false);
					roll_cooldown = roll_cooldown_start;	/// if cooldown = 0 you can roll, else no roll. 
				}
				moveDistanceRemaining = distanceRoll
			}
		
	}
	else
	{
		key_right = 0;
		key_left = 0;
		key_jump = 0;
	}
	
	
	//COOLDOWNS
	if roll_cooldown > 0 roll_cooldown -=1;
	if gun_cooldown > 0 gun_cooldown -=1;
}