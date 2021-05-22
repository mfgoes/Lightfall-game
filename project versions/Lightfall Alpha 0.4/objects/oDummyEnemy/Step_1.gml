/// @description Insert description here
if global.game_paused
{
	exit;
}

if (hp <= 0) 
{
	with (instance_create_layer(x,y,"Enemies",oEnemyCorpse))
	{
		direction = other.hitfrom;	
		hsp = lengthdir_x(1,direction);
		vsp = lengthdir_y(1,direction);
		if (sign(hsp) !=0)
		sprite_index = other.spriteDie;
		image_xscale = sign(hsp) *other.size;
		image_yscale = other.size;
	}
	
	//SPAWN ANOHTER ENEMY 
	instance_create_depth(xstart+random_range(-15,15),ystart,depth,oEnemySpawnerParent);
	
	repeat(3)	//create dust effect
	{
		//dust particles
		with(instance_create_layer(x,bbox_bottom,"Bullets",oDust)) {
			vsp = -0.1; image_alpha = 0.7+random(0.3);
			hsp = random_range(-1,1)
			image_xscale = choose (2,-2);
			image_yscale = choose (2,-2);
		}
		//create exp
		with (instance_create_layer(x+random_range(-4,4),bbox_top+1-random(4),"Bullets",oPickup_ExpOrb)) //create exp orb
		{hsp = random_range(-3,3)}
	}
	audio_play_sound(statue_stomp_02,2,0);
	instance_destroy();
}

//special hit sound (rock enemies)
if place_meeting(x,y,oBullet_Parent) {
	audio_sound_pitch(statue_stomp_01,choose(1.3,1.4)); //higher sound = less intense sounding
	audio_sound_gain(statue_stomp_01,0.4,0);
	audio_play_sound(statue_stomp_01,0,0);	
}