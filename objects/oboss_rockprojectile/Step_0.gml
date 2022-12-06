/// @description Insert description here
#region init timers here
timer_init("collision_wall"); 
/*
//to do: init other alarms here to make it easier to organize
*/
timer_init("after_images"); 

if timer_get("after_images") <= 0 {
	dd = instance_create_layer(x,y,"Bullets",oBulletAfterImagePar);
	dd.sprite_index = sprite_index;
	dd.image_index = image_index;
	dd.image_angle = image_angle;
	timer_set("after_images",10); 
}


#endregion

//enable wall collisions
if timer_get("collision_wall") < 0 && collision_wall = false {
	timer_set("collision_wall",100);
}

if timer_get("collision_wall") = 1 {
	collision_wall = true;	
}

if global.game_paused
{
	exit;
}

if !instance_exists(oPlayer) {
	instance_destroy();		//quick fix	
}

#region visual stuff
if dir != dir_new && alarm[1] <=0 {
	dir = lerp(dir,dir_new,0.8);
}

if alarm[1] > 0 {
	image_angle += 5;	
}

#endregion
x+= lengthdir_x(spd,dir);
y+= lengthdir_y(spd,dir);

//hit player
if (place_meeting(x,y,oPlayer)) && alarm[1] <= 0 && oPlayer.sprite_index != oPlayer.spriteRoll //check if not rolling. Refine later. 
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
		
		//create blood particles
		instance_create_depth(x,y,depth-5,oParticleBlood);
						
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


if collision_wall = true
{
	if (place_meeting(x,y,oWallParent)) && alarm[1] <= 0
	{
		//while (place_meeting(x,y,oWallParent)) 
		//{
		//	x-= lengthdir_x(1,direction);	//move back in direction
		//	y-= lengthdir_y(1,direction);
		//}
		#region effects
			repeat(3)
			{
				instance_create_depth(x,y,depth,oBulletImpactEffect);
				//dust particles
				with(instance_create_layer(x-lengthdir_x(5,direction-180),y-lengthdir_y(5,direction-180),"Bullets",oDust)) {
					vsp = -0.1; image_alpha = 0.5+random(0.3);
					hsp = random_range(-1,1);
					image_xscale = choose (2,-2);
					image_yscale = choose (2,-2);
				}
			}
			//sound and shake
			ScreenShake(2,5);
			var impact_sound = snd_bulletHit;
			audio_sound_pitch(impact_sound,1.3);
			audio_sound_gain(impact_sound,0.1,0);
			if !audio_is_playing(impact_sound) 
				audio_play_sound(impact_sound,0,0);
			
		#endregion
		
		instance_destroy(); 		
	}
}


