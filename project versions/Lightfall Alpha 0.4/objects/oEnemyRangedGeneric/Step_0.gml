 /// @description States
event_inherited(); //inherit HP code

if (live_call()) return live_result;

timer_init("notice_player"); //when to notice player
timer_init("ignore_player"); //when to ignore player
timer_init("turn_around");
timer_init("attack_player");

switch (current_state)
{
	case enemy_states.patrol: {
		// patrol
		if ((grounded) && ( ((!place_meeting(x + hsp*2, y + 1,oWall) && afraid_of_heights)) or place_meeting(x+hsp*2,y, oWall) )) //check ahead for obstacles
		{
			hsp = -hsp;
		}
		x += hsp;
		if hsp != 0 image_xscale = sign(hsp) else {if target.x != x image_xscale = sign(target.x - x); else image_xscale = 1;}
		
		if instance_exists(target)
		{
			//change to approach state
			if (distance_to_object(target) < sight_range) { // && (sign(target.x - x)) == sign(hsp))
				if target.bbox_bottom + 20 >= bbox_bottom-5 && !collision_line(x,y,target.x,target.y-20,oWall,0,0) && timer_get("notice_player") <= 0 {
					current_state = enemy_states.approach;
					dir = sign(target.x - x);
					timer_set("notice_player",30); //small pause before approaching player
					//visual alert that you found the player
					alert = (instance_create_layer(x,bbox_top,layer,oAlertEnemy));
					alert.owner = self; 	
				
					if alerted == 0 {
						//audio_sound_gain(snAlertEnemy,0.2,0); 
						//audio_play_sound(snAlertEnemy,10,0);
						alerted = 1;
					}
				}
			}
		}
	} break;
	case enemy_states.approach: {
		//Use algorithm to follow player (placeholder code)
		if timer_get("notice_player") <= 0
		{
			if !instance_exists(target) current_state = enemy_states.patrol; //revert to patrol if player dies
			else
			{
				var _dir = sign(target.x - x);
				
				if dir != _dir timer_set("turn_around", 40); //remove this? 
				dir = _dir;
				
				if timer_get("turn_around") > 0
				{
					hsp = 0;
				}
				else
				{
					if !place_meeting(x + dir*walkspd*2, y,oWall) hsp = dir*walkspd;
					else hsp = 0;
					if dir != 0 image_xscale = dir;
				}
				
				x += hsp;

				//revert to idle state
				if distance_to_object(target) >= sight_range {
					timer_set("ignore_player",60);
				}
				
				//revert state
				if timer_get("ignore_player") <= 0 {
					if !(target.bbox_bottom + 20 >= bbox_bottom) {
						var _dir = sign(target.x - x); 
						hsp = _dir*walkspd;
						current_state = enemy_states.patrol;
					} 
					else
						timer_set("ignore_player",60);
				}	
				
				//change to attack state
				if distance_to_object(target) < atk_range { //should I check animation stuff here? 
					current_state = enemy_states.attack;
					timer_set("ignore_player",30);
					hsp = 0;
				}
			}
		}
		else
		{
			hsp = 0;
		}
	} break;
	case enemy_states.attack: {
	//keep some distance from player
		if !instance_exists(target)
		{
			current_state = enemy_states.patrol;
		}
		else
		{
			if abs(target.x - x) <= atk_range {
				hsp = sign(target.x - x)*walkspd; 
			}
			
			var _dir = sign(target.x - x);
				
			if dir != _dir timer_set("turn_around", 20);
			dir = _dir;
			
			image_xscale = dir;
						
			//Create bullet
			if timer_get("attack_player") <=0 {
					attack_anim_end = 0;
					if sprite_index = spriteAttack && image_index > 3 { //create bullet on correct animation frame
						timer_set("attack_player",50+choose(10,30,50); 
						var bullet = instance_create_layer(x+lengthdir_x(10,radtodeg(arccos(dir))), y, "bullets", oEbullet)
						bullet.direction = point_direction(x,y,target.x,target.y)+choose(-5,0,5);
						bullet.image_angle = bullet.direction;
						bullet.spd = 2; 
						bullet.damage = 0;
					}
				}
			//revert state
			if distance_to_object(oPlayer) > atk_range {
				current_state = enemy_states.approach;
				attack_anim_end = 0;
			}	
		}
	} break;
}

#region animations (turn to script later)
	if current_state = enemy_states.attack {
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
	}
		
	if current_state != enemy_states.attack {
		if sprite_index = spriteAttack {sprite_index = spriteIdle; image_index = 0;}
		if hsp !=0 sprite_index = sCrowMage_Walk; else sprite_index = sCrowMage_Idle;
		image_speed = 0.8;
	}
	
#endregion	