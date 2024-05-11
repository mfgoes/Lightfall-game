 /// @desc states
//gm live 
//if (live_call()) return live_result; 
if global.game_paused {
	image_speed = 0;
	exit;
}
else if freeze = 0 {
	//determine target
	target = instance_exists(oPlayer) ? oPlayer : -1
	if target!=-1 {
		var min_distance=200

		if point_distance(x,y,target.x,target.y)<min_distance { atk_timer++ }

		if atk_timer>=atk_goal {
			atk_timer=0
			current_state=enemy_states.attack
		}else {
			current_state=enemy_states.approach	
		}
	}else { current_state=enemy_states.idle }
	var mov_spd=0.6
	switch (current_state)
	{
		case enemy_states.idle:
			idle_timer++
			if idle_timer>=idle_goal {
				idle_dir=irandom(359)
				if irandom(2)==0 { idle_dir=-1 } // 1 in 3 chance for the enemy to just stop and not move
			}
			if idle_dir!=-1 {
				idle_dir_lerp=lerp(idle_dir_lerp,idle_dir,0.2)
				h=lerp(h,lengthdir_x(mov_spd,idle_dir_lerp),accel)
				v=lerp(v,lengthdir_y(mov_spd,idle_dir_lerp),accel)
			}
			break
		case enemy_states.approach:
			if instance_exists(target) and abs(dash_h)+abs(dash_v)<3 {
				var prefered_dis=60
				approach_timer++
				if approach_timer>=approach_goal or approach_dir==-1 {
					approach_timer=0
					approach_dir = point_direction(x,y,target.x,target.y)
					if point_distance(x,y,target.x,target.y)<prefered_dis {
						approach_dir+=approach_dir>=180 ? -180 : 180 // making sure that the number wont go into negatives
					}
				}
				approach_dir_lerp=lerp(approach_dir_lerp,approach_dir,0.2)
				h=lerp(h,lengthdir_x(mov_spd,approach_dir_lerp),accel)
				v=lerp(v,lengthdir_y(mov_spd,approach_dir_lerp),accel)
			}
			break
		case enemy_states.attack:
			if instance_exists(target) {
				var dash_strength = random_range(lunge_speed-2,lunge_speed)
				var _dir;
			
				h=0
				knockback_h=0
				v=0
				knockback_v=0
				dodge_amt++
				if dodge_amt>=4 { dodge_amt=0 }
				if dodge_amt>=3 { // every 3rd dodge we dodge twice
					atk_timer=atk_goal-10
				}
				if dodge_amt==2 { 
					_dir=point_direction(x,y,target.x,target.y-100)
					if irandom(4)==0 { atk_timer=atk_goal-10 } // 1 in 5 chance to just dodge again which is pretty op 
				}else {
					_dir = point_direction(x,y,target.x,target.y)	
				}
				dash_h=lengthdir_x(dash_strength,_dir)
				dash_v=lengthdir_y(dash_strength,_dir)
			}
			break
	}
	atk_delay_timer--
	if abs(dash_h)+abs(dash_v) >3 and place_meeting(x,y,target) and atk_delay_timer<=0 {
		atk_delay_timer=atk_delay_goal
		with(instance_place(x,y,oPlayer)) {
			hp-=other.damage;
			flash = 3;
			gunkickx += sign(other.x - x)*5; //from pos enemy to pos player
			ScreenShake(3,2);
			if hp < 1 KillPlayer();
			
			//create blood particles
			instance_create_depth(x,y,depth-5,oParticleBlood);
						
			//play sound
			audio_sound_gain(snFootstep4,0.8,0);
			if !audio_is_playing(snFootstep4) audio_play_sound(snFootstep4,10,0);
		}
	}

	dash_h=lerp(dash_h,0,dash_decay)
	dash_v=lerp(dash_v,0,dash_decay)

	knockback_h=lerp(knockback_h,0,knockback_decay)
	knockback_v=lerp(knockback_v,0,knockback_decay)

	if !place_meeting(x+h+dash_h+knockback_h,y,oWallParent) {
		x+=h+dash_h+knockback_h
	}else {
		knockback_h=(h+dash_h)*-0.75
		h=0
		dash_h=0
	}

	if !place_meeting(x,y+v+dash_v+knockback_v,oWallParent) {
		y+=v+dash_v+knockback_v
	}else {
		knockback_v=(v+dash_v)*-0.75	
		v=0
		dash_v=0
		show_debug_message("hit wall : " + string(knockback_v))
	}

	//animation
	image_speed = 1;
}