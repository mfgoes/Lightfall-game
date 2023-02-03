/// @description abilities + mana management

#region debugging stuff
	//gm live 
	if (live_call()) return live_result; 

	//pause
	if global.game_paused {
		exit;
	}

	//debugmode
	if global.debugmode = true {
		oPlayer.mana = oPlayer.mana_max;
	}  
#endregion

#region init timers
	//cooldown abilities
	timer_init("primary_cooldown");	
	timer_init("secondary_cooldown"); 
	timer_init("special_cooldown"); //For spread attack
	timer_init("attack_recover"); //Animation duration while attacking. Players can't walk while attack recovers. 
	timer_init("weapon_display");	
	timer_init("poof_trail");
#endregion

#region gun recoil
weapon_recoil = max(0,weapon_recoil-1);
#endregion

#region weapon recovery
if timer_get("attack_recover") > 0 {
	oPlayer.hascontrol = 0;
}
else {
	oPlayer.hascontrol = 1;	
}


#endregion
		
#region mana recovery (constant)	
	timer_init("mana_reload");

	if oPlayer.mana < global.player1_mana_max && timer_get("mana_reload") <= 0 {
		oPlayer.mana+=0.1;	
		timer_set("mana_reload",30);
		if oPlayer.mana > global.player1_mana_max oPlayer.mana = global.player1_mana_max; //failsafe if it goes over the limit
	}
#endregion

#region cooldown abilities
	if oPlayer.state != PlayerStateRoll && oPlayer.canrope = 0 {	
		
		//check aim angle 
		var closest = instance_nearest(x,y,pShootable);
		if  closest != noone 
			var true_aim =  point_direction(x,y,closest.x,closest.y-12); else true_aim = 90; 
		if oPlayer.facing_direction = 0 {
			if true_aim < 45 or true_aim > 315 angle_in_range = true; else angle_in_range = false;
		}
		if oPlayer.facing_direction = 180 {
			if true_aim > 135 && true_aim < 225 angle_in_range = true; else angle_in_range = false;
		}
			
		//auto aim at closest object
		if aim_360 = true {
			shoot_direction = image_angle;
		}
		else 
		if distance_to_object(closest) < assist_dist && closest != noone && angle_in_range = true {
			if sign(closest.x - x) = sign(cos(oPlayer.facing_direction)) &&
				!collision_line(x,y-12,closest.x,closest.y-12,oWallParent,0,0) {
					var mask_middle = (closest.bbox_bottom - closest.bbox_top)/2;
					shoot_direction = point_direction(x,y,closest.x,closest.y-mask_middle); //target center of enemy
					
				}
			else 
				shoot_direction = oPlayer.facing_direction;
			} else shoot_direction = oPlayer.facing_direction;
		
		#region attacks / cooldowns
			//primary attack (LMB)
			Ability_Primary_Archer(); 	
		
			//secondary attack (RMB)	//To do: move key check here later so it makes more sense
			Ability_Secondary_Archer(); 
		
			//spread attack (Q)
			//if (oPlayer.key_special) Ability_Special_Shockwave(); //freezing shockwave special
			
			//roll ability (currently in PlayerInput). //To do: move it here. 
		#endregion
	}
#endregion	
