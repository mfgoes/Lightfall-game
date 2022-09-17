/// @description Execute abilities
//gm live 
//if (live_call()) return live_result; 
if global.game_paused
{
	exit;
}

#region init timers
	//cooldown abilities
	timer_init("primary_cooldown");	
	timer_init("secondary_cooldown"); 
	timer_init("special_cooldown"); //For spread attack
	timer_init("attack_recover"); //Animation duration while attacking. Players can't walk while attack recovers. 
	//other
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

#region cooldown abilities
	if oPlayer.state != PlayerStateRoll && oPlayer.canrope = 0 {	
		//auto aim at closest object
		var closest = instance_nearest(x,y,pShootable);
		if distance_to_object(closest) < assist_dist && closest != noone {
			if sign(closest.x - x) = sign(cos(oPlayer.facing_direction)) && abs(closest.y - y) < 100 &&
			!collision_line(x,y-12,closest.x,closest.y-12,oWallParent,0,0) {
				shoot_direction = point_direction(x,y,closest.x,closest.y-12);
			}
		else 
			shoot_direction = oPlayer.facing_direction;			
		}
		else 
			shoot_direction = oPlayer.facing_direction;	
		
		if global.debugmode = true {oPlayer.mana = oPlayer.mana_max;}  
			
		//primary attack (LMB)
		Ability_Primary_Archer(); 	
		
		//secondary attack (RMB)	//To do: move key check here later
		Ability_Secondary_Archer(); 
		
		//spread attack (Q)
		if (oPlayer.key_special)
			//Ability_Special_ArrowRain(); //aggressive special
			Ability_Special_Shockwave(); //freezing shockwave special
	}