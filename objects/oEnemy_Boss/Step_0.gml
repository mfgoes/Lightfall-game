/// @description genearlised multi-enemy state changes (Dec 2021)

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
	timer_init("reset_patrol"); //go back to patrolling if player is out of sight
	timer_init("forget_player"); //forget seeing player after X time and go back to patrolling
	timer_init("attack_player");
	#region state changing happens here
	
	//change state if player is out of bounds
	if !instance_exists(oPlayer) target = id; //failsafe if player isn't there
	
	if collision_line(x,y-5,target.x,target.y-5,oWallParent,0,0) && collision_line(x,y-TILE_SIZE,target.x,target.y-TILE_SIZE,oWallParent,0,0) {
		if timer_get("forget_player") <= 0 {
			//current_state = enemy_states.idle;
			timer_set("reset_patrol",60);
		}
	}
	else {
			//state changing (make this a function later) 
			if timer_get("reset_patrol") <= 0 && distance_to_object(target) < sight_range {
				current_state = enemy_states.approach;	
				timer_set("forget_player",60);
			}
			if distance_to_object(target) < atk_range {	//double chekc hitbox here
				current_state = enemy_states.attack;	
			} else
			if distance_to_object(target) > sight_range {
				//current_state = enemy_states.idle;	//keep in approach state for test
			}
	}	
	#endregion
	
	
#endregion

//basic animations
EnemyAnimationsDefault(); 

//execute different states
if hp > 0 {
	switch (current_state)
	{
		case enemy_states.idle: //state = 0
		scr_state_patrol();
		break;

		case enemy_states.approach: //state = 2
		scr_state_approach();
		break;

		case enemy_states.attack: //state = 3
		scr_state_atk_melee();
		break;
	}
}
else { //stay static
	image_xscale = 1;
}
