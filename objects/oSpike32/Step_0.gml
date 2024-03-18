/// @desc harm player
if place_meeting(x,y,oPlayer) && alarm[0] <= 0 { //only do damage through charge	
	with(oPlayer) {
		flash = 10;
		other.flash = 20; 
		gunkickx = sign(other.x - x)*10; //from pos enemy to pos player
		y-=5;
		audio_sound_gain(snHitEnemy,0.1,0);
		if !audio_is_playing(snHitEnemy) audio_play_sound(snHitEnemy,10,0);
		ScreenShake(1,2);
		hp-=other.damage;
		if hp < 1 KillPlayer();		
		oSpike32.alarm[0] = 50; 
		}
}

//flash self
if flash > 0 {
	flash-=1; 	
}