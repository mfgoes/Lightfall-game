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
	timer_init("special_cooldown");
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

///COOLDOWNS (move to script per cooldown execution
#region
	if oPlayer.state != PlayerStateRoll && oPlayer.canrope = 0 {		
		//primary attack
		Ability_Primary_Archer(); 	
		
		//secondary attack
		Ability_Secondary_Archer(); 
	}