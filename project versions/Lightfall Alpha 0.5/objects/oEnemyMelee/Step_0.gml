/// @description state changes (Dec 2021)
//gm live 
if (live_call()) return live_result; 

#region gravity + basic + timers
	event_inherited(); //inherits gravity code and pause code
	timer_init("attack_player"); 
#endregion

#region state changing
	//state changing (can be a function) 
	if distance_to_object(target) < sight_range {
		current_state = enemy_states.approach;	
	}
	if distance_to_object(target) < atk_range {
		current_state = enemy_states.attack;	
	} else
	if distance_to_object(target) > sight_range {
		current_state = enemy_states.idle;	
	}
#endregion

#region animation
	if current_state = enemy_states.attack && timer_get("attack_player") > 0 {
	//attack animation	
	}
	if current_state = enemy_states.approach {
	image_xscale = sign(x - target.x);	
	}
	if current_state = enemy_states.idle {
	image_xscale = -sign(hsp);	
	}
#endregion

hsp = walkspd * patrol_dir;

#region patrolling
	if current_state = enemy_states.idle {
		var dist_start = round(distance_to_point(xstart,ystart));
		if  dist_start > wander_range {
			patrol_dir*=-1; //this currently glitches sometimes
			x+=patrol_dir*4;
		}
		if !collision_point(x + patrol_dir * TILE_SIZE ,y+TILE_SIZE*2, oWall,0,0) { //check if 2 tiles down is free
			//y-=5; //this is just a visual queue
			patrol_dir*= -1;
			x+=patrol_dir*4;
		}
		else if place_meeting(x + hsp, y, oWall)  {
			//check if you can jump up a tile first
			if !collision_point(x + patrol_dir * TILE_SIZE ,y-TILE_SIZE*2-1, oWall,0,0) {  //check if 2 tiles up is free
				y-=TILE_SIZE; //"Jump" up (improve later)
			}
			else //else flip direction 
			patrol_dir*= -1;
			x+=patrol_dir*4;
		}
		
		x+= hsp;
	}
#endregion

//old code
/*
var dd = instance_nth_nearest(x,y,oEnemyMelee,2); //find nearest object
var _pos_nearest_enemy = sign(dd.x - x); //determine direction nearest object
var _pos_target = sign(target.x - x);   //determine direction to walk in
//check if colliding
var _colliding = abs(sign(_pos_nearest_enemy + _pos_target)); //returns 0 or 1
if distance_to_object(dd) > 0 _colliding = 0; //if closest enemy is far away, ignore
*/

//walking code 
/*
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
*/


//enemy stun code.	only recoil after a short pause (for emphasis)
/*
if stunned > 0 {
	stunned--; //starts at 20
	if stunned > 10 && stunned < 13 && !place_meeting(x,y-vsp,oWall) vsp = -1;
	var stunrecoil = sign(target.x - x)*4; 
	if stunned > 10 && stunned < 13 && !place_meeting(x-stunrecoil,y,oWall) x-=stunrecoil;

var dir = sign(target.x - x); 
if stunned = 15 x+=lengthdir_x(5,dir)
}
			
else
*/

//States
/*
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
		
		if instance_exists(oPlayer) && distance_to_object(target) < sight_range { //only switch if player exists
			if target.bbox_bottom + 20 >= bbox_bottom-5 && !collision_line(x,y,target.x,target.y-20,oWall,0,0)
				current_state = enemy_states.approach; 
		}
		
	} break;
	
	case enemy_states.approach: {
	//Use algorithm to follow player (placeholder code)
	var dir = sign(target.x - x); 
	if !place_meeting(x + dir*walkspd*2, y,oWall)
		hsp = dir*walkspd*2;
	else
		hsp = 0;
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
	
	if timer_get("attack_player") <=0 && instance_exists(oPlayer) {
		timer_set("attack_player",65+random(10)); 
		with(oPlayer) {
			hp-=other.damage;
			flash = 3;
			gunkickx -= sign(other.x - x)*5; //from pos enemy to pos player
			ScreenShake(3,2);
			if hp < 1 KillPlayer();
			//play sound
			audio_sound_gain(snHitEnemy,0.3,0);
			if !audio_is_playing(snHitEnemy) audio_play_sound(snHitEnemy,10,0);
		}
	}
	
	//revert to approach (after animation or if out of range)
	if timer_get("attack_player") = 0 or distance_to_object(oPlayer) > atk_range {
		current_state = enemy_states.approach;
	}	
	
	} break;
	}
#endregion
*/

