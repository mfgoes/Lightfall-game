/// @description Insert description here
// You can write your code in this editor
timer_init("destroy");

//explode
if (hp <= 0) 
{
	current_state = enemy_states.idle;
	//create explosion object
	if timer_get("destroy") <=0 {
		timer_set("destroy", 100+irandom(20));
		
		//feedback animation + sound
		audio_sound_gain(snd_button1,0.7,0);
		audio_play_sound(snd_button1,0,0);
	}
	
	//animate when going to explode (shake)
	
	
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
}

