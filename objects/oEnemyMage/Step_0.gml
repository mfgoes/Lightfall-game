 /// @description States
event_inherited(); //inherit HP code

/*
if !instance_exists(target) {
	hsp = 0; 
	exit;
}*/

//timers moved to parent object

switch (current_state)
{
	case enemy_states.patrol: {
		//patrol
		var wall_infront = place_meeting(x+hsp,y,oWallParent) or place_meeting(x+hsp,y,oPlatformParent);
		var cliff_ahead = (!place_meeting(x+hsp*8,y+1,oWallParent) && !place_meeting(x+hsp*8,y+1,oPlatformParent));
		
		if (wall_infront) or (cliff_ahead && afraid_of_heights) {hsp = -hsp} //else hsp = 0; //turn around if facing wall
		x += hsp;
		//approach player if close
		if (distance_to_object(target) <= sight_range) && !wall_infront { // && (sign(target.x - x)) == sign(hsp))
			current_state = enemy_states.approach;
			dir = sign(target.x - x);
			timer_set("notice_player",30); //small pause before approaching player				
			//visual alert (updated)
			var unique_id = id; 
			alert_box = instance_create_layer(x,bbox_top,layer,oAlertEnemy) 
			with(alert_box) {
				owner = unique_id;
			}
		}
	} break;
	case enemy_states.approach: {
		//Use algorithm to follow player (placeholder code)
		if timer_get("notice_player") <= 0 {
			var _dir = sign(target.x - x);		
			if dir != _dir timer_set("turn_around", 40); //remove this? 
			dir = _dir;
				
			if timer_get("turn_around") > 0
			{
				hsp = 0;
			}
			else
			{
				if !place_meeting(x + dir*walkspd*2, y,oWallParent) hsp = dir*walkspd*2;
				else hsp = 0;
				if dir != 0 image_xscale = dir;
			}
			if (grounded) x += hsp;
			//revert to idle state
			if distance_to_object(target) >= sight_range {
				timer_set("ignore_player",60);
			}
			if distance_to_object(target) < atk_range { //should I check animation stuff here? 
				current_state = enemy_states.attack;
				timer_set("ignore_player",30);
				hsp = 0;
			}
			
		}
		else
		{
			hsp = 0;
		}
	} break;
	case enemy_states.attack: {
	//attack style is unique to mage enemy
			var _dir = sign(target.x - x);	
			if dir != _dir timer_set("turn_around", 20);
			dir = _dir;
			image_xscale = dir;
			//Create bullet
			if timer_get("attack_player") <=0 {
					attack_anim_end = 0;
					if sprite_index = spriteAttack && image_index > 3 { //create bullet on correct animation frame
						timer_set("attack_player",100+choose(0,60,120)); 
						var bullet = instance_create_layer(x+lengthdir_x(10,radtodeg(arccos(dir))), y-12, "bullets", oEbulletFollow)
						bullet.direction = point_direction(x,y,target.x,target.y); //+choose(-5,0,5);
						bullet.image_angle = bullet.direction;
						bullet.sprite_index = sEBullet_Mage;
						bullet.spd = 2; 
						bullet.damage = damage;
						
						//play sound (move this to create code later)
						var sound1 = choose(snElectric_1,snElectric_1,snElectric_4);
						if !audio_is_playing(sound1) {
							//audio_sound_pitch(sound1,choose(1.1,1.05,1));
							audio_play_sound(sound1,0,0,global.sound_volume*0.2);
						}
					}
				}
			//revert state
			if distance_to_object(oPlayer) > atk_range {
				current_state = enemy_states.approach;
				attack_anim_end = 0;
			}	
	} break;
}


#region animations (refactor later)
	if current_state = enemy_states.attack {
			if attack_anim_end = 0 {
			if sprite_index != spriteAttack {
				image_index = 0;			
				image_speed = 1;
				sprite_index = spriteAttack;
			}
			}
			else {
				if sprite_index = spriteAttack {sprite_index = spriteIdle; image_index = 0;}
			}
	}
		
	if current_state != enemy_states.attack {
		if sprite_index = spriteAttack {sprite_index = spriteIdle; image_index = 0;}
		if hsp !=0 && x!=xprevious sprite_index = spriteWalk; else sprite_index = spriteIdle; 
		if hsp != 0 image_xscale = sign(hsp) else {if target.x != x image_xscale = sign(target.x - x); else image_xscale = 1;}
		
		image_speed = 0.8;
	}
	
#endregion	