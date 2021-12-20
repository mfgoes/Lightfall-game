/// @desc specific enemy code
//if (live_call()) return live_result;
if global.game_paused
{
	exit;
}
if (live_call()) return live_result;
#region basics

event_inherited();
	//determine target
	if instance_exists(oPlayer) target = oPlayer; else {
		target = self; 
	}
	event_inherited(); //inherits gravity code
	timer_init("attack_player"); 
	timer_init("attack_anim");
	timer_init("notice_player"); //when to notice player
	timer_init("ignore_player"); //when to ignore player

#endregion

#region avoid collisions with other enemies
	if instance_exists(oEnemyParent) {
		var dd = instance_nth_nearest(x,y,oEnemyParent,2); }  
	else dd = self; 
	var _pos_nearest_enemy = sign(dd.x - x); //determine direction nearest object
	var _pos_target = sign(target.x - x);   //determine direction to walk in
	
	
//check if colliding
	var _colliding = abs(sign(_pos_nearest_enemy + _pos_target)); //returns 0 or 1
	if distance_to_object(dd) > 0 _colliding = 0; //if closest enemy is far away, ignore
#endregion

//walking code for NON idle movement
if current_state != enemy_states.idle && stunned = 0 {  
	if (!place_meeting(x + hsp, y,oWall)) { // && distance_to_object(target) < sight_range && distance_to_object(target) > 1
       //move left
	   if _pos_target < 0 {
		  x+=hsp //- _diff_x;
		  if (_colliding) x-=hsp;
	   }
	   if _pos_target > 0 {
		  x+=hsp //- _diff_x;
		  if (_colliding) x-=hsp;
	   }
	}
	x = lerp(x,round(x),0.2);
}


//enemy stun code.	only recoil after a short pause (for emphasis)
if stunned > 0 {
	stunned--; //starts at 20
	var stunrecoil = (sign(target.x - x)*4);
	if stunned = 15 x+=lengthdir_x(5,sign(target.x - x));
	if stunned > 10 && stunned < 13 && !place_meeting(x,y-vsp,oWall) vsp = -1;
	if stunned > 10 && stunned < 13 && !place_meeting(x-stunrecoil,y,oWall) 
		x-=stunrecoil;
}	
else
#region states
switch (current_state)
{
	// patrol
	case enemy_states.idle: {
		var check_ahead = 25*sign(hsp)
		if (!place_meeting(x+check_ahead,y+1,oWall) && (afraid_of_heights)) or place_meeting(x+hsp,y-1,oWall) {
			hsp = -hsp;
		}
		x += hsp;
		
		var target_in_sight = 0;
		if distance_to_object(target) < sight_range && (sign(target.x - x)) = sign(hsp) target_in_sight = 1; //(target.x < x && hsp < 0) or (target.x > x && hsp > 0)
		
		//change to approach state
		if instance_exists(oPlayer) && target_in_sight { //only switch if player exists
			if target.bbox_bottom + 20 >= bbox_bottom-5 && !collision_line(x,y,target.x,target.y-20,oWall,0,0) && timer_get("notice_player") <= 0 {
				current_state = enemy_states.approach; 
				timer_set("notice_player",40); //small pause before approaching player
				
				//visual alert (updated)
				var unique_id = id; 
				alert_box = instance_create_layer(x,bbox_top,layer,oAlertEnemy) 
				with(alert_box) {
					owner = unique_id;
				}
				
				if alerted = 0 {
					//audio_sound_gain(snAlertEnemy,0.2,0);
					//audio_play_sound(snAlertEnemy,10,0);
					alerted = 1;
				}
			}
		}
	} break;
	
	case enemy_states.approach: {
	//pause before attack
	if timer_get("notice_player") > 0 or !place_meeting(x,y+1,oWall) { //this might cause problems later
		hsp = 0; 
		image_speed = 0
	}
	else
	{
		//Use algorithm to follow player (placeholder code)
		var dir = sign(target.x - x); 
		if !place_meeting(x + dir*walkspd*3, y,oWall)
			hsp = dir*walkspd*2;
		else
			hsp = 0; 
		//revert state
		if timer_get("ignore_player") <= 0 {
			if !(target.bbox_bottom + 20 >= bbox_bottom) {
				var dir = sign(target.x - x); 
				hsp = dir*walkspd;
				current_state = enemy_states.idle;
			} 
			else
				timer_set("ignore_player",80);
		}	
		//change to attack state
		if distance_to_object(target) < atk_range && timer_get("notice_player") <= 0 {
			current_state = enemy_states.attack;
			timer_set("ignore_player",80);
		}
	}
	} break;
	
	case enemy_states.attack: {
	//keep small distance from player
	if abs(target.x - x) <= atk_range {
		hsp = sign(target.x - x)*0.5; 
	}
	if attack_anim_end = 0 {
		if sprite_index != spriteAttack {
			image_index = 0;			
			image_speed = 0.5;
			sprite_index = spriteAttack;
		}
	}
	else {
		if sprite_index = spriteAttack {sprite_index = spriteIdle; image_index = 0;}
	}
	
	if timer_get("attack_player") <=0 && instance_exists(oPlayer) {
		attack_anim_end = 0;
		if sprite_index = spriteAttack && image_index > 2 {
			//set timer for attacks (put combo sequences here)
			timer_set("attack_player",60); 
			//do damage
			with(oPlayer) {
				flash = 3;
				gunkickx -= sign(other.x - x)*5; //from pos enemy to pos player
				audio_sound_gain(snHitEnemy,0.3,0);
				if !audio_is_playing(snHitEnemy) audio_play_sound(snHitEnemy,10,0);
				hp-=other.damage;
				ScreenShake(5,5);
				if hp < 1 KillPlayer();				
			}
		}
		}
	//revert state
	if timer_get("ignore_player") <= 0 {
		if !(target.bbox_bottom + 20 >= bbox_bottom) {
			var dir = sign(target.x - x); 
			hsp = dir*walkspd;
			current_state = enemy_states.idle;
		} 
		else
			timer_set("ignore_player",80);
	}
	if distance_to_object(oPlayer) > atk_range {
		current_state = enemy_states.approach;
		attack_anim_end = 0;
	}	
	} break;
	
}
#endregion

#region animations
	if current_state != enemy_states.attack
	{
		grounded = true;
		image_speed = 0.8;
		if (hsp == 0)
		{
			sprite_index = spriteIdle;
			image_speed = 0.3;
		}
		else
		{
			sprite_index = spriteWalk;
			image_speed = 0.5;
		}
	}
	//mirror sprite
	if (hsp != 0) image_xscale = -sign(hsp) * size;
	image_yscale = size; 
#endregion