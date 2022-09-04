/// @description Insert description here
// You can write your code in this editor
//gm live 
//if (live_call()) return live_result;
if global.game_paused
{
	exit;
}

vsp = vsp + grv; 

//Vertical collision
VerticalCollision();

if !instance_exists(mywall) && screen_shake = 0 {
	audio_sound_gain(snFootstep1,0.5,0);
	audio_play_sound(snFootstep1,10,false);

	with(mywall) instance_destroy();
	flash = 4;
	image_speed = 0.6;
	screen_shake = 1;
	ScreenShake(1,5);



	repeat(ceil(random_range(1,2)))		//create dust effect
	{
		//dust particles
		with(instance_create_layer(x,bbox_bottom,"Bullets",oDust))
		{vsp = -0.1; image_alpha = 0.3+random(0.3);
		hsp = random_range(-1,1)}
		//create exp
		with (instance_create_layer(x+random_range(-4,4),bbox_top+1-random(4),"Bullets",oOrb_Mana)) //create exp orb
		{hsp = random_range(-3,3)}
	}
}