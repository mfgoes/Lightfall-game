 //general gravity
if global.game_paused {
	exit;
}

//parent timers
timer_init("notice_player"); //when to notice player
timer_init("ignore_player"); //when to ignore player
timer_init("turn_around");
timer_init("attack_player");
timer_init("freeze_anim"); 


//movement
VerticalCollision();  //gravity
grounded = (place_meeting(x,y+1,oWallParent) or place_meeting(x,y+1,oPlatformParent)); //was oWallParent

//knockback
if !place_meeting(x+gunkickx,y+gunkicky,oWallParent) && gunkickx != 0 {
	x+=gunkickx;
	y-=gunkicky; 
	gunkickx *= 0.8; //decelerate (potentailly do this after a timer
	gunkicky *= 0.6; //decelerate y faster;
	
	if abs(gunkickx) < 1 {
		gunkickx = 0; gunkicky = 0;
	}
	
}


//destroy if outside room + fallen
if y > room_height {
	hp = 0;
}

#region animation flags 

	if freeze > 0 {
		image_speed = 0;
		freeze--;
	}
	else {
		
		//fix for freeze 
		if freeze != 0 freeze = 0;
		
		if hp <= 0 {
			//sprite_index = spriteDie;	
			hsp = 0; //prevents flipping
		}
		else if current_state = enemy_states.attack && timer_get("attack_reload") > 0 {
			sprite_index = spriteAttack;
		}
		else if current_state = enemy_states.approach {
			sprite_index = spriteWalk;
			image_speed = 1;
		}
		else if current_state = enemy_states.idle && hp > 0 {
			if hsp = 0
				sprite_index = spriteIdle;
			else
				sprite_index = spriteWalk;
			image_speed = 1;
		}
	}
#endregion