/// @description Insert description here
if global.game_paused
{
	exit;
}

if !instance_exists(oPlayer) {
	instance_destroy();		//quick fix	
}

//lerp direction so it's smooth
if dir != dir_new && alarm[1] <=0 {
	dir = lerp(dir,dir_new,0.8);
}

x+= lengthdir_x(spd,dir);
y+= lengthdir_y(spd,dir);

//hit player
if (place_meeting(x,y,oPlayer)) 
{
	with(instance_place(x,y,oPlayer))
	{
		hp-=other.damage;
		flash = 3;
		hitfrom = other.direction;
		gunkickx = cos(degtorad(other.direction))*1;
		gunkicky = -2;
		ScreenShake(1,5);
		audio_sound_gain(snHitEnemy,0.4,0);
		audio_play_sound(snHitEnemy,0,0);
		
		if hp < 1 KillPlayer();
	}
	
	repeat(3)
	{
		//dust particles
		with(instance_create_layer(x+lengthdir_x(24,dir),y,"Bullets",oDust)) {
			vsp = -0.1; image_alpha = 0.5+random(0.3);
			hsp = random_range(-1,1);
			image_xscale = choose (2,-2);
			image_yscale = choose (2,-2);
		}
	}
	instance_create_depth(x,y,depth,oBulletImpactEffect);
	 
	instance_destroy(); 
}


if collision_wall
{
	if (place_meeting(x,y,oWallParent))
	{
		
		instance_create_depth(x,y,depth,oBulletImpactEffect);
		ee = instance_create_depth(x+lengthdir_x(24,dir),y+lengthdir_y(20,dir),depth,oBulletAfterImagePar);
		ee.sprite_index = sprite_index;
		ee.image_index = image_index;
		
		while (place_meeting(x,y,oWallParent)) 
		{
			x-= lengthdir_x(1,direction);	//move back in direction
			y-= lengthdir_y(1,direction);
		}
		#region effects
			repeat(3)
			{
				instance_create_depth(x,y,depth,oBulletImpactEffect);
				//dust particles
				with(instance_create_layer(x,y,"Bullets",oDust)) {
					vsp = -0.1; image_alpha = 0.5+random(0.3);
					hsp = random_range(-1,1);
					image_xscale = choose (2,-2);
					image_yscale = choose (2,-2);
				}
			}
		//sound and shake
		ScreenShake(2,5);
		var impact_sound = snDeck4rd_impact_01_001;
		audio_sound_pitch(impact_sound,choose(1,1,0.9,0.8));
		audio_sound_gain(impact_sound,0.3,0);
		if !audio_is_playing(impact_sound) 
			audio_play_sound(impact_sound,0,0);
			
		#endregion
		instance_destroy(); 		
		
	}
}


