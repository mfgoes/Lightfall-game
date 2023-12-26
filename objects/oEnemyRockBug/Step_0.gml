/// @description genearlised multi-enemy state changes (Dec 2021)

//if (live_call()) return live_result; 
enemy_gravity_and_freeze(); 

var can_move = (instance_exists(target) && instance_exists(oPlayer) && freeze = 0)

//live
if (live_call()) return live_result; 

if (can_move) {	
	//declare some reusable variables
	timer_init("player_sight");
	var dis_from_target=point_distance(x,y,target.x,y)
	var dis_min=25; 
	var plr_dir = sign(target.x-x); if plr_dir = 0 plr_dir=1; //if x = same as player, force direction to right 
			
	//switch between states: idle, approach player, lunge at player, attack player, step away from player (idle) 
	switch(current_state)
	{		
		case enemy_states.approach: //player is spotted and you commence the attack. 
			{		
				scr_state_approach(); //basic approach code
				scr_enemy_leap_v2(); //leap towards player when close by
				//scr_enemy_lunge(); //melee attack (moved out of leap code in Nov 2022)
				scr_enemy_throw_rocks(); //throws rocks at player (only when in air from jump)
				scr_revert_to_patrol(); 
			}
			//animations
			var dir = sign(target.x - x); if dir = 0 {dir = 1;}
			image_xscale = -dir; 	
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
		case enemy_states.patrol:
		{
			scr_enemy_patrol();	
		}
	}	
}


