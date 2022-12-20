/// @description Insert description here
//gm live 
//if (live_call()) return live_result; 

#region particles
	if random(1) < 0.05
	part_particles_create(global.partSystem, x+random_range(-12,12), y-5, global.ptBasic, 0.2);	
#endregion

//touch player, summon boss or teleport
if place_meeting(x,y-1,oPlayer)
{
	//go to next level
	if boss_defeated = true {
		with (oPlayer) 
		{
			if (hascontrol) && (key_up) //if confirming portal
			{
				hascontrol = false;
				SlideTransition(TRANS_MODE.GOTO,other.target);
			}
		}
	}
	//summon boss
	else if boss_summon = false {
		boss_summon = true;
		summon = instance_create_depth(x,y-1,depth-10,oSpawnAnimation); //spawn close to portal but not on portal
		summon.spawn_type = spawn_type; 
		summon.boss_enemy = true;
		//summon.ScreenShake(2,6);
	}
}
else 
if instance_exists(oCamFollow) with(oCamFollow) instance_destroy(); 