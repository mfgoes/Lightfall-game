/// @description Insert description here
if global.game_paused
{
	exit;
}

timer_init("poof_trail");
timer_init("poof_trail_close");
timer_init("arrow_fade");

//fade arrows/bullets
if timer_get("arrow_fade") = 0 {
	if image_alpha > 0 {image_alpha-=0.1; timer_set("arrow_fade",5);} else
	{
	instance_destroy(); //instance_change(oHitSpark,1);
	}
}

//collision wall
if (place_meeting(x,y,oWall)) && (image_index !=0) && active = true
	{
		if timer_get("arrow_fade") <0 {timer_set("arrow_fade",180);}
		spd = 0; layer_add_instance("Tiles_1",id); depth+=1;
		sprite_index = sArrowInWall;
		//mask_index = sArrowInWall;
		active = false; 		
		
		dd = instance_create_depth(x,y,depth,oBulletImpactEffect);
		x+= lengthdir_x(8,direction);
		y+= lengthdir_y(8,direction)+vsp;
	}

//collision targets
var _hsp = lengthdir_x(spd,direction);
if (place_meeting(x,y,pShootable)) && active = true
	{
	
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
	
	//freeze frame
	scrFreezeScreen(50); 
	
	with(instance_place(x,y,pShootable))
	{
		instance_create_depth(x,y,depth,oBulletImpactEffect);
		var collision = true;
		if object_index == oEnemyShield
		{
			collision = false;
			var _dir = image_xscale == 1 ? -1 : 1;
			if sign(_hsp) != _dir
			{
				collision = true;
			}
		}
			
		if collision
		{
			hp-=other.damage;
			flash = 3;
			hitfrom = other.direction;
		}
		
	}
	//create poof + dmg counter
	instance_create_depth(x,y,depth,oBulletImpactEffect);
	dd = instance_create_depth(x,y,depth-10,oDmgCounter);
	dd.value = damage;
	instance_destroy();
}


