// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerInput(){
	if (hascontrol)
	{
		key_left = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check(0,gp_padl);
		key_right = keyboard_check(vk_right) || keyboard_check(ord("D")) || gamepad_button_check(0,gp_padr);
		key_jump = keyboard_check_pressed(vk_space) || gamepad_button_check(0,gp_face2);
		key_down = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check(0,gp_padd);
		key_up = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check(0,gp_padu);
		key_equip = keyboard_check(ord("E")) || gamepad_button_check(0,gp_face4);
		key_pausegame = keyboard_check(vk_escape) || gamepad_button_check(0,gp_start);
		
		//Abilities - These are dependant on the selected character
		if alarm[0] == -1 key_primary = mouse_check_button(mb_left)		|| gamepad_button_check(0,gp_face1);		//Ranged attack
		key_secondary = mouse_check_button(mb_right)	|| gamepad_button_check(0,gp_shoulderr);	//Melee attack
		key_special = keyboard_check(ord("Q"))			|| gamepad_button_check(0,gp_face3);		//AOE attack
		key_roll =  keyboard_check_pressed(ord("F"))	|| gamepad_button_check(0,gp_face2);		//Evade
		key_grapple = keyboard_check(ord("G"))			|| gamepad_button_check(0,gp_shoulderl);	//Grappling hook (unlock later)
		
		//Special
		if alarm[0] == -1 key_attack_released =  (mouse_check_button_released(mb_left)) || (gamepad_button_check_released(0,gp_shoulderrb));
		
		//Gamepad sepecific controls
		if (key_left) || (key_right) || (key_jump)
		{
			gamepad_on = 0;	
		}

		if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
		{
			key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));	
			key_right = max(gamepad_axis_value(0,gp_axislh),0);
			gamepad_on = 1;
		}

		//secondary ability 
		if (key_secondary) {
			if secondary_cooldown = 0 && roll_cooldown < 10 { //almost done rolling
				image_index = 0; 
				//image_speed = 0;
				state = call_ability[cooldown_ability.secondary]; //state = PlayerStateMeleeAtk;
				secondary_cooldown = secondary_cooldown_full;
				} 
		}
		
		//third ability -> exploding missile 
		if (key_special) { 
			if third_cooldown = 0 && roll_cooldown < 10 { //almost done rolling
				image_index = 0; image_speed = 0; 
				third_cooldown = third_cooldown_full;
				state = PlayerStateSpecialAtk; 			
			}
		}
		
		//roll ability 	
		if (key_roll) //enter roll state
			{
				if state = PlayerStateFree && roll_cooldown = 0 {
					state = PlayerStateRoll;
					audio_sound_gain(snLanding,0.2,0);
					audio_play_sound(snLanding,4,false);
					roll_cooldown = roll_cooldown_full;	/// if cooldown = 0 you can roll, else no roll. 
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
	if primary_cooldown > 0 primary_cooldown -=1;
	if secondary_cooldown > 0 {secondary_cooldown -=1;}
	if third_cooldown > 0 {third_cooldown -=1;}
		
	//if any cooldown is not 0 (except bow) don't allow movement.
}
