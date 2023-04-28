/// @description genearlised multi-enemy state changes (Dec 2021)

//if (live_call()) return live_result; 
#region gravity + basic + timers
	if global.game_paused {
		exit;
	}
	//gravity
	VerticalCollision(); 
	grounded = (place_meeting(x,y+1,oWallParent) or place_meeting(x,y+1,oPlatformParent));

	//This exists in the parent step event
	//but event_inherited is never called 
	//by this object
	if y > room_height
		hp = 0;
#endregion

//hit by player
if freeze > 0 {
		freeze--;	
}


if instance_exists(target) && freeze = 0 {
	
	//declare some reusable variables
	var dis_from_target=point_distance(x,y,target.x,y)
	var dis_min=25; 
	var plr_dir = sign(target.x-x); if plr_dir = 0 plr_dir=1; //if x = same as player, force direction to right 
			
	//switch between states: idle, approach player, lunge at player, attack player, step away from player (idle) 
	switch(current_state)
	{	
	case enemy_states.approach: //not sure why he rewrote this code
		{		
			scr_state_approach(); //basic approach code
			//scr_enemy_leap(); //leap towards player when close by
			scr_enemy_lunge(); //melee attack (moved out of leap code in Nov 2022)
		}
		//animations
		var dir = sign(target.x - x); if dir = 0 {dir = 1;}
		image_xscale = -dir; 	
		break;
		
	case enemy_states.lunge: 
		{
			image_xscale = dir_atk * -1
			atk_anim_x = lerp(atk_anim_x, dir_atk * anim_x_length, 0.2);
			atk_check = true;
			if abs(atk_anim_x - dir_atk * anim_x_length) < 1 {
				current_state = enemy_states.idle;
			} //idle state makes enemy stand still for a second before going to approach again
		} 
		break;
	
	case enemy_states.idle: //pause before attacking again
		{
			if atk_check = true {
				atk_check = false
				if place_meeting(x+atk_anim_x*3,y,target) {
					atk_delay_timer = atk_delay_goal;
					
					with(oPlayer) if state != PlayerStateRoll {	//check if player is NOT dodging
						player_hurt_by_enemy(); 
					} 
					else { //dodge
						//this can be a small script
						player_dodge_success(); 
						
					}
				}
			}
			atk_anim_x = lerp(atk_anim_x, 0, 0.25)
			if abs(atk_anim_x) < 0.05 {
				atk_delay_timer = atk_delay_goal;
				atk_anim_x = 0;
				current_state = enemy_states.approach;
			}
		}
		break;
	}	
}
//show_debug_message(string(x) + " " + string(atk_anim_x) + " " + string(sprite_index))
atk_delay_timer--;

