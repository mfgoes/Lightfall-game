
// Patrol the vicinity and jump over walls when required. 
function scr_state_patrol(){
	timer_init("jump_duration");
	//TILE_SIZE = 16px; 
	var dir = patrol_dir; 
	var dist_start = round(distance_to_point(patrol_xstart,patrol_ystart));
	var tile_ahead = (collision_point(x + dir*TILE_SIZE/2,y-5, oWallParent,0,0));
	var tile_above = (collision_point(x + dir*TILE_SIZE/2,y-TILE_SIZE*3, oWallParent,0,0));
	var space_above = (collision_point(x + dir*TILE_SIZE/2,y-1, oWallParent,0,0)); //if 1 pixel above is free
	var tile_below = (collision_point(x + dir*TILE_SIZE/2,y+TILE_SIZE, oWallParent,0,0));	

	if (grounded) {
		//check above
		if !(tile_above) && (tile_ahead) {
			if timer_get("jump_duration") <= 0 
				timer_set("jump_duration",15);
		}
		
		//check below
		else if !(tile_below) {
			patrol_dir*= -1;
		}
		
		//check ahead
		else if (tile_ahead) {
			patrol_dir*= -1;
		}	
	}
		
	//move
	if (grounded) && !(tile_ahead) {
		hsp = lerp(hsp,walk_spd * patrol_dir,0.1);
		x+= hsp;
	}
	//jump if possible
	if timer_get("jump_duration") > 0 {
		if !(space_above) { //check if jump is still required, otherwise lerp jump.
			timer_set("jump_duration",50);
			y-=4;
			exit;
		}
		else 
			y-=5;	 
	}
}
	
//Dodge player sometimes 
function enemy_dodge_player() {
	timer_init("reset_dodge_ability");
	
	var dodge_dir = sign(target.x - x); 
	var timer = 50;
	
	if timer_get("reset_dodge_ability") <= 0 {
		timer_set("reset_dodge_ability",timer);
	}
}
	
//Approach the player
function scr_state_approach(){
	if (live_call()) return live_result; 
	
	timer_init("jump_duration");
	var dist_start = round(distance_to_point(patrol_xstart,patrol_ystart));
	var dir = sign(target.x - x); 
	//var dist_target = abs(target.x-x); 
	var tile_ahead = (collision_point(x + dir*TILE_SIZE/2,y-5, oWallParent,0,0));
	var tile_above = (collision_point(x + dir*TILE_SIZE/2,y-TILE_SIZE*5, oWallParent,0,0));
	var space_above = (collision_point(x + dir*TILE_SIZE/2,y-1, oWallParent,0,0)); //if 1 pixel above is free
	var tile_below = (collision_point(x + dir*TILE_SIZE/2,y+TILE_SIZE*3, oWallParent,0,0));	
	var can_approach = (maintain_distance = true && distance_to_object(target) > 50 or maintain_distance = false); 
	if (grounded) {
		//check above	//don't check below
		if !(tile_above) && (tile_ahead) {
			if timer_get("jump_duration") <= 0 
				timer_set("jump_duration",25); //max jump height
		}

		//check ahead
		if (tile_ahead) {
			hsp = 0;
			//revert to patrol
		}
		else {
			hsp = lerp(hsp,sign(dir)*approach_spd,0.1); //set facing direction
				
		}
	}
		
	//MOVE
	if (grounded) && !(tile_ahead) && distance_to_object(target) >= atk_range {	
		if round(x) != round(target.x) && can_approach
			x += hsp;
		//reset patrol position
		patrol_xstart = x; 
		patrol_ystart = y;  
	} else {
		hsp = 0;
	}
	//jump to get closer to player
	if timer_get("jump_duration") > 0 {
		if !(space_above) { //check if jump is still required, otherwise lerp jump.
			timer_set("jump_duration",0);
			y-=4; //to do: lerp to make it more like a jump. make the code more logical
			exit;
		}
		else 
			y-=5;	 
	}
	
	//attack code = moved to separate function 
}
	
//Attack the player (close ranged) 
function scr_state_atk_melee(){
if timer_get("attack_reload") <=0 { 
	var reload_spd_r = reload_spd; //+ irandom(15); 
	timer_set("attack_reload",reload_spd_r);
	timer_set("anim_prep",reload_spd-5);
	timer_set("anim_retract",0); //reset retract animation
	atk_anim_x = 5; //start animated (reset this at the end)
	if distance_to_object(target) < atk_range hsp = 0;	
	
	//make sure player is within hitbox before executing damage
	//draw_rectangle(x-sign(x - target.x)*hitbox_w,y,x,y-hitbox_h,0);
	if collision_rectangle(x-sign(x-target.x)*hitbox_w,y,x,y-hitbox_h,target,0,0) {
		with(oPlayer) {
			hp-=other.damage;
			flash = 3;
			gunkickx -= sign(other.x - x)*2; //from pos enemy to pos player
			ScreenShake(3,2);
			if hp < 1 KillPlayer();
			//play sound
			audio_sound_gain(snHitEnemy,0.2,0);
			if !audio_is_playing(snHitEnemy) audio_play_sound(snHitEnemy,10,0);
		}
	}
}
}

//frog leap (no damage)
function scr_enemy_leap_random() {
	//REWORKED LEAP CODE
	timer_init("leap_timer");
	var dir = sign(target.x - x); if dir = 0 {dir = 1;}
	var dist_target = abs(target.x-x); 
			
	if timer_get("leap_timer") <= 0 { //set this somewhere later 
		 			
		h_leap_goal = leap_horizontal_str * dir; //h_leap is the goal, not the actual leap
		if hsp != 0 last_faced = dir; 
		v_leap = leap_amount; //strength of leap
				
		//vertical leap
		if dist_target >50 && dist_target < 200 {
			//curve leap
			var acc = 1;
			if h_leap_goal = 0 {
				acc = 1.2;
			} 
			else acc = 0.8 //in the future, can make this based on player distance too
			h_leap = lerp(h_leap,h_leap_goal,acc);
			if (grounded) {
				vsp += v_leap;
			}
			timer_set("leap_timer",choose(100,200,240));
		}
		
	} 
	else if timer_get("leap_timer") < 30 { //cutoff point 
			h_leap_goal = 0; 
	}
			
	//horizontal leap 
	if !place_meeting(x + h_leap, y, oWallParent) && !place_meeting(x + h_leap, y, oBlockade) { 
		var acc = 0.04; if vsp > 0 && grounded acc = 1; //if landed, don't slide 
		h_leap = lerp(h_leap,0,acc); 
		x+=h_leap
	}	
	
	
}

//updated leap test (2023)
function scr_enemy_leap_if_close() {
	timer_init("leap_timer"); //how often to leap
    timer_init("leap_duration"); //how long to leap (longer = higher jump)
    
	var dir = sign(target.x - x); if dir = 0 { dir = 1; }
    var dist_target = abs(target.x - x);

	//leap if timer is 0, and if on ground
    if (timer_get("leap_timer") <= 0 && dist_target > 20) && grounded {
		//make jump dependent on distance + obstacles
		var duration = 8; 
		
		var tile_above = (collision_point(x + dir*TILE_SIZE,y-TILE_SIZE*3, oWallParent,0,0));
		if tile_above or dist_target > TILE_SIZE*3
			duration = 12; 
        timer_set("leap_duration", duration); // Duration of the leap
		timer_set("leap_timer", choose(80,100)); //when to leap again
    }

    // Apply horizontal leap movement if leap is ongoing
    if (timer_get("leap_duration") > 0) && distance_to_object(target) < 40 {
		v_leap = lerp(vsp,3.5,0.4);
		h_leap = lerp(sign(hsp),4,0.6); 
        vsp -= v_leap
    }
	
	//horizontally move towards player when leaping in the air
	var leap_margin = 50; 
	var leap_x_goal = leap_margin*dir + target.x; //slightly next to player
	//var can_approach = (maintain_distance = true && distance_to_object(target) < 50 or maintain_distance = false); 
	
	if !grounded && place_free(x + h_leap*dir,y) && distance_to_object(target) > leap_margin {
		x += h_leap*dir; //don't move x in multiple areas
	}
		
	// Check for the end of the leap
    if (timer_end("leap_duration")) {
		v_leap = 0; 
		//keep moving horizontally
    }
	
	//throw rock when in the air, at an angle
	//if !grounded && !place_meeting(x,y+TILE_SIZE,oWallParent) {
	//	scr_enemy_throw_rocks();
	//}
}



function scr_enemy_lunge(){
	//ATTACK 
	var dir = sign(target.x - x); 
	if current_state = enemy_states.approach {
		timer_init("lunge_timer");
		if timer_get("lunge_timer") <= 0 && (place_meeting(x+dir*8,y,target)) && (grounded) && h_leap = 0 {
			timer_set("lunge_timer",40);
			current_state = enemy_states.lunge; //used lunge instead of attack, in case enemies can do both. 
			dir_atk=dir;
			sprite_index = spriteAttack;
			attack_anim_end = 0; 
		}	
	}
}


//Attack the player (close ranged) 
function scr_state_atk_shoot(){
	//shooting
	if timer_get("attack_reload") <=0 { 
		var dir = sign(target.x - x); 
		var reload_spd_r = reload_spd + irandom(15); 
		timer_set("attack_reload",reload_spd_r);
	
		//create bullet
		var bullet = instance_create_layer(x+lengthdir_x(10,radtodeg(arccos(dir))), y-12, "bullets", oEbulletFollow)
		bullet.direction = point_direction(x,y-20,target.x,target.y)+choose(-2,0,2);
		bullet.image_angle = bullet.direction;
		bullet.sprite_index = sEBullet_Mage;
		bullet.spd = 4; 
		bullet.damage = 3;
	}
	
	//also allow movement
	if distance_to_object(target) > preferred_range {
		var dir = sign(target.x - x); 
		if !place_meeting(x + dir*approach_spd, y,oWallParent) {
			hsp = dir*approach_spd; }
		else {
			hsp = 0;}
		
		if place_meeting(x + dir*approach_spd, y, oWallParent)  {
			if !collision_point(x + dir,y-TILE_SIZE-1, oWallParent,0,0) {  //check if 2 tiles up is free
				y-=TILE_SIZE; //"Jump" up (improve later)
				hsp = dir*approach_spd;
			
				//x+=hsp;
			}		
		}		
		if (grounded) {
			x += hsp; //grounded check prevents clipping
			//reset patrol position
			patrol_xstart = x; 
			patrol_ystart = y;  
		}
	} else hsp = 0;
		
}

function scr_boss_atk_throwrocks() { //boss enemy
	//shooting
	if timer_get("range_attack") <=0 { 
		var dir = sign(target.x - x); 
		timer_set("range_attack",120);
		//create bullet
		repeat(3) {
			var bullet = instance_create_layer(x+lengthdir_x(10,radtodeg(arccos(dir))), y-22, "bullets", oBoss_RockProjectile)
			bullet.dir = random(150)+20 //change after alarm
			bullet.dir_new = dir;
			bullet.spd = 1;
			//alarm for changing direction
			bullet.image_angle = bullet.direction;
		}
	}
}

function scr_state_atk_spikes() {
	//do spike attack
}

function scr_enemy_blink() { //blink means teleporting towards the player

	if timer_get("blink_timer") <= 0 {
		var dir = sign(target.x - x); 
		//determine new position
		var x_new = target.x-preferred_range*dir;
		var y_new = target.y-10;
		var dist_old = point_distance(x,y,target.x,target.y);
		var dist_new = point_distance(x_new,y_new,target.x,target.y); //distance from new point to "target" enemy. 
		//check new position area
		var bbox_width_half = sprite_get_width(mask_index)/2;
		var bbox_height = sprite_get_height(mask_index);
		
		if (dist_new < dist_old) && !collision_rectangle(x_new-bbox_width_half,y_new-bbox_height,x_new+bbox_width_half,y_new,oWallParent,0,0) { // !place_meeting(x_new,y_new,oWallParent) &&
			x = x_new;
			y = y_new;
			timer_set("blink_timer",60);
		
			//feedback
			audio_sound_gain(snBlinkEnemy,0.6,0);
			audio_play_sound(snBlinkEnemy,5,0);
			repeat(3) with(instance_create_layer(x,bbox_bottom,"Bullets",oDust)) { //dust particles
				vsp = -0.1; image_alpha = 0.3+random(0.3);
				hsp = random_range(-1,1);
				image_xscale = choose (2,-2);
				image_yscale = choose (2,-2);
			}	
		}
	}
}

//More enemy attacks
function scr_enemy_attack_bullrun() {
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
		if !audio_is_paused(snDash)
			audio_play_sound(snDash,10,0);
			
		bullrush_dir = sign(target.x - x); //set a trajectory
		timer_set("start_bullrush",105); //time before you can charge again)
		timer_set("charge_timer",80); //how long the charge can be (unless hitting a wall)
		if timer_get("do_dmg") < 30 timer_set("do_dmg",0);
	}

	//charge to player if in sight
	if (target.bbox_bottom + 20 >= bbox_bottom) && timer_get("charge_timer") > 0 {
		hsp = round(bullrush_dir*walk_spd*2);
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
	if timer_get("charge_timer") = 0 or place_meeting(x+hsp,y,oWallParent) {
		if place_meeting(x+hsp,y,oWallParent) {
			audio_sound_gain(snHitSplashy,0.3,0); audio_play_sound(snHitSplashy,4,0);
			timer_set("start_bullrush",30+round(10)); 
		}
		hsp = 0; 
		timer_set("charge_timer",0);
	}
	//move
	if (!place_meeting(x + hsp, y,oWallParent)) x+=hsp; 
	
	//revert state
	if timer_get("ignore_player") <= 0 {
		if !(target.bbox_bottom + 20 >= bbox_bottom) {
			var dir = sign(target.x - x); 
			hsp = dir*walk_spd;
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
}