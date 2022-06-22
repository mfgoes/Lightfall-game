
// Patrol the vicinity and jump over walls when required. 
function scr_state_patrol(){
	timer_init("jump_duration");
	//TILE_SIZE = 16px; 
	var dir = patrol_dir; 
	var dist_start = round(distance_to_point(patrol_xstart,patrol_ystart));
	var tile_ahead = (collision_point(x + dir*TILE_SIZE/2,y-5, oWall,0,0));
	var tile_above = (collision_point(x + dir*TILE_SIZE/2,y-TILE_SIZE*3, oWall,0,0));
	var space_above = (collision_point(x + dir*TILE_SIZE/2,y-1, oWall,0,0)); //if 1 pixel above is free
	var tile_below = (collision_point(x + dir*TILE_SIZE/2,y+TILE_SIZE, oWall,0,0));	

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
			timer_set("jump_duration",0);
			y-=4;
			exit;
		}
		else 
			y-=5;	 
	}
}
	
	
	
//Approach the player
function scr_state_approach(){
	timer_init("jump_duration");
	var dist_start = round(distance_to_point(patrol_xstart,patrol_ystart));
	var dir = sign(target.x - x); 
	var dist_target = abs(target.x-x); 
	var tile_ahead = (collision_point(x + dir*TILE_SIZE/2,y-5, oWall,0,0));
	var tile_above = (collision_point(x + dir*TILE_SIZE/2,y-TILE_SIZE*5, oWall,0,0));
	var space_above = (collision_point(x + dir*TILE_SIZE/2,y-1, oWall,0,0)); //if 1 pixel above is free
	var tile_below = (collision_point(x + dir*TILE_SIZE/2,y+TILE_SIZE*3, oWall,0,0));	
	
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
		else 
			hsp = lerp(hsp,dir*approach_spd,0.1); //set facing direction
	}
		
	//MOVE
	if (grounded) && !(tile_ahead) && (dist_target>20) {	
		if round(x) != round(target.x) 
			x += hsp;
		//reset patrol position
		patrol_xstart = x; 
		patrol_ystart = y;  
	}
	//jump if possible
	if timer_get("jump_duration") > 0 {
		if !(space_above) { //check if jump is still required, otherwise lerp jump.
			timer_set("jump_duration",0);
			y-=4;
			exit;
		}
		else 
			y-=5;	 
	}
}
	
//Attack the player (close ranged) 
function scr_state_atk_melee(){
if timer_get("attack_reload") <=0 { 
	var reload_spd_r = reload_spd; //+ irandom(15); 
	timer_set("attack_reload",reload_spd_r);
	timer_set("anim_prep",reload_spd-5);
	timer_set("anim_retract",0); //reset retract animation
	atk_anim_x = 5; //start animated (reset this at the end)
			
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

//frog leap (no damage)
function scr_enemy_leap() {
	//REWORKED LEAP CODE
	timer_init("leap_timer");
	var dir = sign(target.x - x); if dir = 0 {dir = 1;}
	var dist_target = abs(target.x-x); 
			
	if timer_get("leap_timer") <= 0 { //set this somewhere later 
		 			
		h_leap_goal = leap_horizontal_str * dir; //h_leap is the goal, not the actual leap
		if hsp != 0 last_faced = dir; 
		v_leap = leap_ver_str; 
				
		//vertical leap
		if dist_target >20 && dist_target < 200 {
			//curve leap
			var acc = 1;
			if h_leap_goal = 0 {
				acc = 1.2;
			} 
			else acc = 0.8 //in the future, can make this based on player distance too
			h_leap = lerp(h_leap,h_leap_goal,acc);
			if (grounded) {vsp += v_leap;}
			timer_set("leap_timer",90);
		}
		
	} 
	else if timer_get("leap_timer") < 30 { //cutoff point 
			h_leap_goal = 0; 
	}
			
	//horizontal leap 
	if !place_meeting(x + h_leap, y, class_wall) && !place_meeting(x + h_leap, y, oBlockade) { 
		var acc = 0.04; if vsp > 0 && grounded acc = 1; //if landed, don't slide 
		h_leap=lerp(h_leap,0,acc); 
		x+=h_leap
	}	
	
	timer_init("lunge_timer");
	if timer_get("lunge_timer") <= 0 && (place_meeting(x+dir*8,y,target)) && (grounded) && h_leap = 0 {
		timer_set("lunge_timer",50);
		current_state = enemy_states.lunge;
		dir_atk=dir;
	}	
}


function scr_enemy_lunge(){
	
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
		bullet.damage = 0;
	}
	
	//also allow movement
	if distance_to_object(target) > preferred_range {
		var dir = sign(target.x - x); 
		if !place_meeting(x + dir*approach_spd, y,oWall) {
			hsp = dir*approach_spd; }
		else {
			hsp = 0;}
		
		if place_meeting(x + dir*approach_spd, y, oWall)  {
			if !collision_point(x + dir,y-TILE_SIZE-1, oWall,0,0) {  //check if 2 tiles up is free
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
		
		if (dist_new < dist_old) && !collision_rectangle(x_new-bbox_width_half,y_new-bbox_height,x_new+bbox_width_half,y_new,oWall,0,0) { // !place_meeting(x_new,y_new,oWall) &&
			x = x_new;
			y = y_new;
			timer_set("blink_timer",60);
		
			//feedback
			audio_sound_gain(Futuristic_Sounds__23_,0.3,0);
			audio_play_sound(Futuristic_Sounds__23_,5,0);
			repeat(3) with(instance_create_layer(x,bbox_bottom,"Bullets",oDust)) { //dust particles
				vsp = -0.1; image_alpha = 0.3+random(0.3);
				hsp = random_range(-1,1);
				image_xscale = choose (2,-2);
				image_yscale = choose (2,-2);
			}	
		}
	}
}