// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerInput(){
	if move_transition!=0 {
		key_right = move_transition==-1 ? 1 : 0;
		key_left = move_transition==1 ? 1 : 0;
		key_jump = 0;
		show_debug_message(key_left)
	}
	if (hascontrol)
	{
		key_left = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(0,gp_padl);
		key_right = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(0,gp_padr);
		key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_face2);
		key_jump_held = keyboard_check(vk_space) || gamepad_button_check(0,gp_face2);
		key_down = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check(0,gp_padd);
		key_up = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check(0,gp_padu);
		key_equip = keyboard_check(ord("E")) || gamepad_button_check(0,gp_face4);
		key_pausegame = keyboard_check(vk_escape) || gamepad_button_check(0,gp_start);
		
		//Abilities - These are dependant on the selected character
		if alarm[0] == -1 
		key_primary = mouse_check_button(mb_left)		|| gamepad_button_check(0,gp_face1)			|| keyboard_check(ord("J"));	
		key_secondary = mouse_check_button(mb_right)	|| gamepad_button_check(0,gp_shoulderr)		|| keyboard_check(ord("K"));	
		key_secondary_released =  mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0,gp_shoulderr) || keyboard_check_pressed(ord("K"));	
		key_special = keyboard_check(ord("Q"))			|| gamepad_button_check(0,gp_face3)			|| keyboard_check(ord("L"));	
		key_roll =  keyboard_check_pressed(ord("F"))	|| gamepad_button_check(0,gp_face2);		//Evade
		key_grapple = keyboard_check(ord("G"))			|| gamepad_button_check(0,gp_shoulderl);	//Grappling hook (unlock later)
		
		//decide facing direction (move later if required)
		if (key_left) facing_direction = 180; if (key_right) facing_direction = 0; 
		
		//Special
		if alarm[0] == -1 key_primary_released =  (mouse_check_button_released(mb_left)) || (gamepad_button_check_released(0,gp_shoulderrb)) || keyboard_check_released(ord("J"));
		
		//Gamepad sepecific controls
		if (key_left) || (key_right) || (key_jump)
		{
			global.gamepad_on = 0;	
		}

		if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
		{
			key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));	
			key_right = max(gamepad_axis_value(0,gp_axislh),0);
			global.gamepad_on = 1;
		}
		
		//roll ability 	
		if (key_roll)  //enter roll state
			{
				if state = PlayerStepMovement  && roll_cooldown = 0 &&  oPlayer.mana >= 3 { 
					state = PlayerStateRoll;
					oPlayer.mana -= 2;
					audio_sound_gain(snJump1,0.5,0);
					audio_sound_pitch(snJump1,0.7);
					audio_play_sound(snJump1,4,false);
					roll_cooldown = roll_cooldown_full;	/// if cooldown = 0 you can roll, else no roll. 
					oUIElements.roll_cooldown = 0;
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
}
