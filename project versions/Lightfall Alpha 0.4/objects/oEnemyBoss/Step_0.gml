if global.game_paused
{
	exit;
}

var timer_active = (timer_get("ignore_player") > 0);

timer_init("notice_player"); //when to notice player
timer_init("ignore_player"); //when to ignore player
timer_init("turn_around");
timer_init("attack_player");

grounded = place_meeting(x, y + 1, oWall);

switch (current_state)
{
	case enemy_states.patrol: {
		// patrol
		if ((grounded) && ( ((!place_meeting(x + hsp, y + 1,oWall) && afraid_of_heights))
								or place_meeting(x+hsp,y, oWall) ))
		{
			hsp = -hsp;
		}
		x += hsp;
		if hsp != 0 image_xscale = sign(hsp)
		
		if instance_exists(target)
		{
			//change to approach state
			if (distance_to_object(target) < sight_range && (sign(target.x - x)) == sign(hsp)) { //only switch if player exists
				if target.bbox_bottom + 20 >= bbox_bottom-5 && !collision_line(x,y,target.x,target.y-20,oWall,0,0) && timer_get("notice_player") <= 0 {
					current_state = enemy_states.approach;
					dir = sign(target.x - x);
					timer_set("notice_player",40); //small pause before approaching player
					//visual alert that you found the player
					alert = (instance_create_layer(x,bbox_top,layer,oAlertEnemy));
					alert.owner = self; 	
				
					if alerted == 0 {
						audio_sound_gain(snAlertEnemy,0.2,0);
						audio_play_sound(snAlertEnemy,10,0);
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
			if !instance_exists(target) current_state = enemy_states.patrol;
			else
			{
				var _dir = sign(target.x - x);
				
				if dir != _dir timer_set("turn_around", 20);
				dir = _dir;
				
				if timer_get("turn_around") > 0
				{
					hsp = 0;
				}
				else
				{
					if !place_meeting(x + dir*walkspd*2, y,oWall) hsp = dir*walkspd*2;
					else hsp = 0;
					image_xscale = dir;
				}
				
				if grounded
				{
					if place_meeting(x + dir*walkspd*2, y,oWall)
					{
						vsp -= jump_speed;
					}
				}
				
				x += hsp;

				//revert to idle state
				if distance_to_object(target) >= sight_range {
					timer_set("ignore_player",80);
				}
				
				//revert state
				if timer_get("ignore_player") <= 0 {
					if timer_active {
						var _dir = sign(target.x - x); 
						hsp = _dir*walkspd;
						current_state = enemy_states.patrol;
					}
				}	
				
				//change to attack state
				if distance_to_object(target) < atk_range {
					current_state = enemy_states.attack;
					if timer_get("attack_player") <= 0 timer_set("attack_player",30);
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
	//keep small distance from player
		if !instance_exists(target)
		{
			current_state = enemy_states.patrol;
		}
		else
		{
			var _dir = sign(target.x - x);
				
			if dir != _dir timer_set("turn_around", 20);
			dir = _dir;
			
			if timer_get("turn_around") > 0
			{
				timer_set("attack_player",60);
			}
			else
			{
				image_xscale = dir;
			}
			
			if timer_get("attack_player") <=0 {
					timer_set("attack_player",60); 
					//Create bullet
					var bullet = instance_create_layer(x + sprite_width/2, y + sprite_height/4, "bullets", oEbullet);
					bullet.sprite_index = sEnemyBossSword;
					bullet.image_xscale = image_xscale;
					bullet.direction = bullet.image_xscale == 1 ? 0 : 180;
					bullet.spd = 0;
					bullet.collision_wall = false;
					bullet.destroy_self = true;
				}
			//revert state
			//if timer_get("ignore_player") <= 0 {
			//	var _dir = sign(target.x - x);
			//	hsp = _dir*walkspd;
			//	current_state = enemy_states.patrol;
			//}
			if distance_to_object(oPlayer) > atk_range {
				current_state = enemy_states.approach;
			}	
		}
	} break;
}

//gravity
event_inherited();