// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyAnimationsDefault(){
if current_state = enemy_states.attack && timer_get("attack_reload") > 0 {
		//attack animation	
	}
	if current_state = enemy_states.approach {
		if hp > 0 image_xscale = sign(x - target.x); else image_xscale = 1;	
	}
	if current_state = enemy_states.idle {
		if hp > 0 image_xscale = -sign(hsp);	
	}
	
	//attack animation code
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
}