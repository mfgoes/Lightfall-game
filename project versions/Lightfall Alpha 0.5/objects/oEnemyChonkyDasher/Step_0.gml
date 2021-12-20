//gm live
if global.game_paused
{
	exit;
}



#region basics + timers
	event_inherited(); //inherits gravity code
	//determine target
	if instance_exists(oPlayer) target = oPlayer; else {
		target = self; 
	}
	timer_init("do_dmg"); //do damage every X seconds
	timer_init("start_bullrush"); //make a charge every X seconds
	timer_init("charge_timer"); //charge distance (X seconds, or hit wall to stop charge)
	timer_init("notice_player"); //when to notice player
	timer_init("ignore_player"); //when to ignore player
	
#endregion

//find placements
if instance_exists(oEnemyParent) {
var dd = instance_nth_nearest(x,y,oEnemyParent,2);} //find nearest object
else dd = self; 
var _pos_nearest_enemy = sign(dd.x - x); //determine direction nearest object
var _pos_target = sign(target.x - x);   //determine direction to walk in
//check if colliding
var _colliding = abs(sign(_pos_nearest_enemy + _pos_target)); //returns 0 or 1
if distance_to_object(dd) > 0 _colliding = 0; //if closest enemy is far away, ignore

//walking code 
if current_state = enemy_states.approach && stunned = 0 {  
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
		var check_ahead = 2*sign(hsp)
		if (!place_meeting(x+check_ahead,y+1,oWall) && (afraid_of_heights)) or place_meeting(x+hsp,y-1,oWall) {
			hsp = -(hsp);
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
					audio_sound_gain(snAlertEnemy,0.2,0);
					audio_play_sound(snAlertEnemy,10,0);
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
		if !place_meeting(x + dir*walkspd, y,oWall)
			hsp = dir*walkspd; //dir*walkspd;
		else
			hsp = 0;
		//revert to idle state
		if distance_to_object(target) >= sight_range or collision_line(x,y,target.x,target.y-20,oWall,0,0) {
			var dir = sign(target.x - x); 
			hsp = round(dir*walkspd);
			current_state = enemy_states.idle;
		}	
		//change to attack state (after pause)
		if distance_to_object(target) < atk_range && timer_get("notice_player") <= 0 {
			current_state = enemy_states.attack;
			timer_set("ignore_player",80);
		}
		}
	}
	break;
	
	case enemy_states.attack: {
	
	#region do damage upon collision
	var dir = sign(target.x - x);
	if place_meeting(x,y,oPlayer) && timer_get("do_dmg") <= 0 && timer_get("charge_timer") > 0 { //only do damage through charge
		timer_set("do_dmg",50);
		with(oPlayer) {
			flash = 3;
			gunkickx = sign(other.x - x)*10; //from pos enemy to pos player
			y-=10;
			audio_sound_gain(snHitEnemy,0.1,0);
			if !audio_is_playing(snHitEnemy) audio_play_sound(snHitEnemy,10,0);
			ScreenShake(1,2);
			hp-=other.damage;
			if hp < 1 KillPlayer();
			
			}
		}
	#endregion
		
	//setup boost
	if timer_get("start_bullrush") <= 0 {
		audio_sound_gain(snDash,0.2,0);
		audio_play_sound(snDash,10,0);
		bullrush_dir = sign(target.x - x); //set a trajectory
		timer_set("start_bullrush",105); //time before you can charge again)
		timer_set("charge_timer",80); //how long the charge can be (unless hitting a wall)
		if timer_get("do_dmg") < 30 timer_set("do_dmg",0);
	}

	//charge to player if in sight
	if (target.bbox_bottom + 20 >= bbox_bottom) && timer_get("charge_timer") > 0 {
		hsp = round(bullrush_dir*walkspd*2);
		//effects
		if random(1) < 0.5 with(instance_create_layer(x,bbox_bottom,"Player",oDust)) {
			vsp = -0.1; image_alpha = 0.3+random(0.3);
			image_speed = 0.5;
			hsp = random_range(-1,1)
			image_xscale = choose (1,-1);
			image_yscale = choose (1,-1);
		}
	}
	
	//stop charge 
	if timer_get("charge_timer") = 0 or place_meeting(x+hsp,y,oWall) {
		if place_meeting(x+hsp,y,oWall) {
			audio_sound_gain(snHitSplashy,0.3,0); audio_play_sound(snHitSplashy,4,0);
			timer_set("start_bullrush",30+round(10)); 
		}
		hsp = 0; 
		timer_set("charge_timer",0);
	}
	//move
	if (!place_meeting(x + hsp, y,oWall)) x+=hsp; 
	
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
	
	//change to approach if done charging. (Avoid running off cliffs later)
	if distance_to_object(oPlayer) > atk_range && timer_get("charge_timer") <= 0 {
		current_state = enemy_states.approach;
		attack_anim_end = 0;
		bullrush_dir = 0;
	}	
		
	#region animations
	if attack_anim_end = 0 && place_meeting(x,y,target) {
		if sprite_index != spriteAttack {
			image_index = 0;			
			image_speed = 0.5;
			sprite_index = spriteAttack;
		}
	}
	else {
		if (attack_anim_end = true) or sprite_index = spriteWalk {sprite_index = spriteIdle; image_speed = 0.3;} //if not completing attack animation
	}
	#endregion	
		
	} break;
	
}
#endregion




#region animations
	
	/*if current_state = enemy_states.attack {
		if timer_get("attack_anim") <= 0 {
		
		}
	}
	*/
	if current_state != enemy_states.attack
	{
		grounded = true;
		image_speed = 0.8
		if (hsp == 0)
		{
			sprite_index = spriteIdle;
			image_speed = 0.3;
		}
		else
		{
			sprite_index = spriteWalk;
			image_speed = 0.8;
		}
	}
	else {
		image_speed = 0.5;	
	}
	
	//jump animation
	/*if (!place_meeting(x,y+1,oWall)) 
	{
		grounded = false;
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}*/

	//mirror sprite
	if (hsp != 0) {
		image_xscale = -sign(hsp) * size; }
	else if distance_to_object(target) < sight_range {
		image_xscale = sign(x-target.x); }
	image_yscale = size; 
#endregion
	
	