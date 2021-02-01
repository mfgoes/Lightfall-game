 /// @desc states

//gm live 
if (live_call()) return live_result; 
if distance_to_point(xstart,ystart) > 50 out_of_range = true else out_of_range = false;

timer_init("attack_player"); 

switch (current_state)
{
	//wandering code
	case enemy_states.idle: {
		motion_speed = 0.6;
		//attack player if close by
		if distance_to_object(oPlayer) < sight_range
			current_state = enemy_states.approach;
		
		//move back if too from start point
		if (out_of_range) {
			var randomizer = random(360); 
			targetx = xstart + lengthdir_x(wander_range,randomizer); 
			targety = ystart + lengthdir_y(wander_range,randomizer);
			dir = point_direction(x,y,targetx,targety);
			
			var dx = cos(degtorad(dir))*(motion_speed);
			var dy =-sin(degtorad(dir))*(motion_speed);
			x+=dx;
			y+=dy;
			}
			//move back if out of range
			//decelerate
			/*
			if distance_to_point(targetx,targety) < wander_range*0.33 {
				motion_speed = lerp(motion_speed,0.5,0.25); }
			//accelerate
			if distance_to_point(targetx,targety) > wander_range*0.66 {
				motion_speed = lerp(motion_speed,1,0.25); }
			*/
			else {
			//reset point on circle: 
			if distance_to_point(targetx,targety) < 1 {
			var dist_extra = 100;
			var randomizer = random(360); 
			targetx = xstart + lengthdir_x(wander_range,randomizer + random_range(-dist_extra,dist_extra)); //set new target point
			targety = ystart + lengthdir_y(wander_range,randomizer);
			dir = round(point_direction(x,y,targetx,targety));
			}
			
			//regular wandering code
			var dx = cos(degtorad(dir))*(motion_speed);
			var dy =-sin(degtorad(dir))*(motion_speed);
			x+=dx;
			y+=dy;
			}		
	} break;
	case enemy_states.approach: {
		if instance_exists(oPlayer) {
			if place_meeting(x,y,oPlayer) && timer_get("attack_player") <=0 {
				with(instance_place(x,y,oPlayer)) {
					hp-=other.damage;
					flash = 3;
					gunkickx += sign(other.x - x)*5; //from pos enemy to pos player
					ScreenShake(3,20);
					if hp < 1 KillPlayer();
					//play sound
					audio_sound_gain(snFootstep4,0.2,0);
					if !audio_is_playing(snFootstep4) audio_play_sound(snFootstep4,10,0);
				}
				timer_set("attack_player",40+random(10)); 
				motion_speed = 0.7
			}
			else motion_speed = 1.2;
		
			if distance_to_object(oPlayer) > -5 {
				//move_towards_point(oPlayer.x,oPlayer.y,motion_speed); //enable hovering inside this
				dir = point_direction(x,y,oPlayer.x+lengthdir_x(10,dir),oPlayer.y+lengthdir_y(3,dir));
				var dx = cos(degtorad(dir))*(motion_speed);
				var dy =-sin(degtorad(dir))*(motion_speed);
				x+=dx;
				y+=dy;
			}
		
			//revert to idle state
			if distance_to_object(oPlayer) >= sight_range {
					current_state = enemy_states.idle;
				}
			
		} else current_state = enemy_states.idle;
	} break;
}

//animation
