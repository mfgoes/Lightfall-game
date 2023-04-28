/// @description explode on death
//Since this enemy has a special trigger upon death, it overwrites the original code. 

//init timers
timer_init("destroy");

//explode steps
if (hp <= 0) 
{
	#region 1. revert step to idle (so it doesn't move)
		current_state = enemy_states.idle;
		//create explosion object
		if timer_get("destroy") <=0 {
			timer_set("destroy", 90+irandom(20));
		
			//feedback animation + sound
			audio_sound_gain(snd_button1,0.7,0);
			audio_play_sound(snd_button1,0,0);
		}
	#endregion
		
	#region 2. animate dead enemy
		//animate shaking when dead
		if hp <= 0 {
			shake_dir+=60;
			shake_x = sin(shake_dir* pi / 180)*0.5; //random_range(-1,1); 
			anim_x_new = 1;
	
			//occasionally make smoke effect
			if random(1) < 0.2 with(instance_create_layer(x,y-20,"Bullets",oDust)) {
					vsp = -2; image_alpha = 0.3+random(0.3);
					hsp = random_range(-1,1);
					image_xscale = choose (2,-2);
					image_yscale = choose (2,-2);
			}
		}
	#endregion
	
	#region 3. explode enemy after timer goes off
		if timer_get("destroy") = 1
		{
			instance_destroy();
			repeat 20
			{
				var bit = instance_create_layer(x, y, "Bullets", oExplodingBits)
				bit.hspeed = random_range(-5, 5);
				bit.vspeed = random_range(-5, 5);
			}
			instance_create_layer(x, y, "Bullets", oExplosion);
			audio_sound_gain(statue_stomp_01,0.3,0);
			audio_play_sound(statue_stomp_01,0,0);
			event_inherited();
		}
	#endregion
}

