//gm live 
if (live_call()) return live_result; 

#region basics
event_inherited(); //inherits gravity code
timer_init("attack_player"); 
//determine target
if instance_exists(oPlayer) target = oPlayer; else {
	hsp = 0;
	target = 0; 
}
#endregion

//General walking code (add bounce here)
if current_state!= enemy_states.idle && stunned = 0 {
	if abs(round(target.x - x)) < atk_range && (!place_meeting(x + hsp, y,oWall)) {
		x-=hsp;
		}
	else	
	if abs(round(target.x - x)) > atk_range && (!place_meeting(x + hsp, y,oWall)){
		x+=hsp;
	}
}


//enemy stun code.	only recoil after a short pause (for emphasis)
if stunned > 0 {
	stunned--; //starts at 20
	if stunned > 10 && stunned < 13 && !place_meeting(x,y-vsp,oWall) vsp = -1;
	var stunrecoil = sign(target.x - x)*4; 
	if stunned > 10 && stunned < 13 && !place_meeting(x-stunrecoil,y,oWall) x-=stunrecoil;

var dir = sign(target.x - x); 
if stunned = 15 x+=lengthdir_x(5,dir)

}

			
else
//States
#region states
		switch (current_state)
	{
	case enemy_states.idle: {
		// patrol
		
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
	hsp = dir*walkspd*2; //twice as fast
	//if (!place_meeting(x+hsp,y,oWall))
	//x += hsp;
	

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
		hsp = sign(target.x - x); //revert direction
		//if (!place_meeting(x-sign(hsp)*walkspd,y,oWall))
		//x -= hsp*1; 
	}
	
	//set attack timer
	/*
	if timer_get("attack_player") <=0 && instance_exists(oPlayer) {
		timer_set("attack_player",65+random(10)); 
		with(oPlayer) {
			hp-=other.damage;
			flash = 3;
			gunkickx -= sign(other.x - x)*5; //from pos enemy to pos player
			ScreenShake(3,20);
			if hp < 1 KillPlayer();
			//play sound
			audio_sound_gain(snHitEnemy,0.3,0);
			if !audio_is_playing(snHitEnemy) audio_play_sound(snHitEnemy,10,0);
		}
	}
	*/
	//revert to approach (after animation or if out of range)
	if timer_get("attack_player") = 0 or distance_to_object(oPlayer) > atk_range {
		current_state = enemy_states.approach;
	}	
	
	} break;
	}
#endregion

#region animation
	if current_state = enemy_states.attack && timer_get("attack_player") > 0 {
	//attack animation	
	}
	if (!place_meeting(x,y+1,oWall)) 
	{
		grounded = false;
		sprite_index = spriteJump;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
	else 
	{
		grounded = true;
		image_speed = 0.8
		if (hsp == 0)
		{
			sprite_index = spriteIdle;
		}
		else
		{
			sprite_index = spriteWalk;
		}
	}

	if (hsp != 0) image_xscale = sign(hsp) * size;
	image_yscale = size; 
#endregion