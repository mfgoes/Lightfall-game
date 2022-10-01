/// @description genearlised multi-enemy state changes (Dec 2021)

//if (live_call()) return live_result; 
#region 
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
	//BOSS ATTACKS
	timer_init("range_attack"); //let this go off every few seconds
	timer_init("spike_attack"); //let this go off every few seconds
	
	if !instance_exists(oPlayer) target = id; //failsafe if player isn't there
	
	#region state changing 
	
	//CHANGE TO IDLE STATE
	if collision_line(x,y-5,target.x,target.y-5,oWallParent,0,0) && collision_line(x,y-TILE_SIZE,target.x,target.y-TILE_SIZE,oWallParent,0,0) {
		if timer_get("forget_player") <= 0 {
			//current_state = enemy_states.idle;
			timer_set("reset_patrol",60);
		}
	}
	
	//CHANGE STATE TO APPROACH OR ATTACK
	else {
			//state changing (make this a function later) 
			if timer_get("reset_patrol") <= 0 && distance_to_object(target) < sight_range  {
				
				if timer_get("range_attack") <= 100
					current_state = enemy_states.approach;	
				timer_set("forget_player",60);
				
				//BOSS ATTACK
				if timer_get("range_attack") <= 0 {
					current_state = enemy_states.powerattack; 
					hsp = 0;
				}
				
			}
			
			if distance_to_object(target) < atk_range && collision_rectangle(x-sign(x-target.x)*hitbox_w,y,x,y-hitbox_h,target,0,0) && timer_get("range_attack") > 10 {
				current_state = enemy_states.attack;	//remove completely maybe
			} else
			if distance_to_object(target) > sight_range {
				//current_state = enemy_states.idle;	//keep in approach state for test
			}
	}	
	#endregion
	
	
#endregion

//basic animations
EnemyAnimationsDefault(); 

//Boss specific animations
#region
	 if current_state = enemy_states.powerattack {
		if hsp = 0 {
			sprite_index = spriteIdle;	
		}
	 }
	if hp < hp_max/2 atk_range = 5; //boss is more aggressive when low HP
#endregion

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
		
		case enemy_states.powerattack: //state = 4
			//randomize switching these. spike = rare, less rare when HP is less than X. 
			//if HP = less than X, make atk_type = 3
			if atk_type = 1 scr_state_atk_throwrocks();				
			if atk_type = 2 scr_state_atk_spikes();
		break;
	}
}
else { //stay static
	image_xscale = 1;
}
