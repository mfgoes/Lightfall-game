//gm live 
//if (live_call()) return live_result;
if global.game_paused
{
	exit;
}

#region basics
event_inherited(); //inherits gravity code
timer_init("attack_player"); 
timer_init("attack_anim");

//determine target
if instance_exists(oPlayer) target = oPlayer; else {
	target = self; 
}
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

//walking code 
if current_state!= enemy_states.idle && stunned = 0 {  
	if (!place_meeting(x + hsp, y,oWall)) && distance_to_object(target) < sight_range && distance_to_object(target) > 1 {
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
		
		if ((grounded) && (afraid_of_heights) && (!place_meeting(x + hsp, y + 1,oWall))) or (place_meeting(x+hsp,y, oWall))
		{
			hsp = -hsp;
		}
		x += hsp;
		if instance_exists(oPlayer) && distance_to_object(target) < sight_range
		current_state = enemy_states.approach; 
	} break;
	
	case enemy_states.approach: {
	//Use algorithm to follow player (placeholder code)
	var dir = sign(target.x - x); 
	if !place_meeting(x + dir*walkspd*2, y,oWall)
		hsp = dir*walkspd*2;
	else
		hsp = 0;
	//revert to idle state
	if distance_to_object(target) >= sight_range {
		var dir = sign(target.x - x); 
		hsp = dir*walkspd;
		current_state = enemy_states.idle;
		}	
	//change to attack state
	if distance_to_object(target) < atk_range {
		current_state = enemy_states.attack;
		}
	} break;
	
	case enemy_states.attack: {
	//keep small distance from player
	if abs(target.x - x) <= atk_range {
		hsp = sign(target.x - x); 
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