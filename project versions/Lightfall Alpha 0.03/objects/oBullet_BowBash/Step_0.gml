/// @description
//gm live 
//if (live_call()) return live_result; 

#region disappear after attack
	//init timers
	timer_init("attack_length");
	if timer_get("attack_length") = -1 timer_set("attack_length",sprite_get_number(oPlayer.sprite_index)+2); //duration of attack = animation length
	if timer_get("attack_length") = 0 instance_destroy(); 
#endregion

#region collision
	if (place_meeting(x,y,pShootable))
	{
		with(instance_place(x,y,pShootable))
		{
			hp-=1; //does 1 damage
			flash = 3;
			hitfrom = other.direction;
			//play sound
			audio_sound_gain(snFootstep3,0.25,0);
			if !audio_is_playing(snFootstep3) audio_play_sound(snFootstep3,5,0);
		}
		//instance_destroy(); let projectile hit multiple objects
	}
	
#endregion

//keep hitbox close to player
{
x = follow.x + x_shift;
y = follow.y;
}
