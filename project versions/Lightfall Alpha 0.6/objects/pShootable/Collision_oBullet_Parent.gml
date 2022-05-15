/// @description Insert description here
#region play sound
	//script to run specific sound? 
	if (place_meeting(x,y,oDummyEnemy)) {
		audio_sound_pitch(statue_stomp_01,choose(1.3,1.4)); //higher sound = less intense sounding
		audio_sound_gain(statue_stomp_01,0.4,0);
		audio_play_sound(statue_stomp_01,0,0);	
	} 
	else 
	{
		audio_sound_gain(snd_bulletHit,0.2,0);
		audio_sound_pitch(snd_bulletHit,choose(1,1.1,1.18));
		audio_play_sound(snd_bulletHit,3,0);
	}
#endregion
	