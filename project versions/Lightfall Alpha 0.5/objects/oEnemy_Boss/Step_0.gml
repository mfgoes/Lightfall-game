/// @description state changes (Dec 2021)

//if (live_call()) return live_result; 
#region gravity + basic + timers
	if global.game_paused
	{
	exit;
	}
	event_inherited(); //inherits gravity code and pause code
	timer_init("attack_reload"); 
	timer_init("anim_prep"); 
	timer_init("anim_retract"); 
	timer_init("blink_timer"); 
	
	var atk_timer = timer_get("attack_reload");
	
	#region state changing
	//state changing (can be a function) 
	if distance_to_object(target) < sight_range {
		current_state = enemy_states.approach;	
		alerted = true;
	}
	if distance_to_object(target) < atk_range {
		current_state = enemy_states.attack;	
	} else
	if distance_to_object(target) > sight_range && alerted = false {
		current_state = enemy_states.idle;	
	} else {
		current_state = enemy_states.approach; //if you attack the boss it no longer becomes idle
	}
	
	//blink
	{
		//blink if out of bounds (teleport close to player)
		if distance_to_object(target) > atk_range {
			scr_enemy_blink(); //maybe set arguments about blink speed and position later //jan 2022	
		}
	}
	
	#endregion
#endregion

//basic animations
EnemyAnimationsDefault(); 

//execute different states
switch (current_state)
{
	case enemy_states.idle:
	scr_state_patrol();
	break;

	case enemy_states.approach:
	scr_state_approach();
	break;

	case enemy_states.attack:
	scr_state_atk_shoot(); //change to shooting
	break;
}