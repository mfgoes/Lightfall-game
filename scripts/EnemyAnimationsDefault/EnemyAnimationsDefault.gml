// includes basic melee visual (no sprite needed)
function EnemyAnimationsDefault() {
		if freeze > 0 {
			image_speed = 0;
			freeze--;
		}
		else {
			//if dying
			if hp <= 0 {
				sprite_index = spriteDie;	
				hsp = 0;
			}
			//states
			else if current_state = enemy_states.attack && timer_get("attack_reload") > 0 {
				sprite_index = spriteAttack;
				
			}
			else if current_state = enemy_states.approach or current_state = enemy_states.idle {
				if hsp = 0
					sprite_index = spriteIdle;
				else
					sprite_index = spriteWalk;
				image_speed = 1;
			}
			
			//flip sprite if moving
			 if hsp != 0
				image_xscale = -sign(hsp);
			else
				image_xscale = -sign(target.x-x); 
		}
	
	#region mellee attack visual (jab attack)
		if current_state != enemy_states.attack {
				atk_anim_x = lerp(atk_anim_x,0,0.2);} 
		else {
			if timer_get("anim_prep") >= 0 {
			if atk_anim_x > 0 atk_anim_x = lerp(atk_anim_x,0,0.3);
			}
			if timer_get("anim_retract") >= 0 {
				if atk_anim_x < 8 atk_anim_x = lerp(atk_anim_x,8,0.8);
			}
		
			if timer_get("anim_prep") <= 0 && timer_get("anim_retract") <= 0 {
				timer_set("anim_retract",10);
			}
		}
	#endregion
}