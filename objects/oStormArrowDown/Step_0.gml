/// @description Insert description here
// You can write your code in this editor
timer_init("poof_trail");
timer_init("poof_trail_close");
timer_init("arrow_fade");
#region start
if spd > 0 { //check if in wall
	x+= lengthdir_x(spd,direction);
	y+= lengthdir_y(spd,direction);

	//poof 
	if timer_get("poof_trail") <= 1 && particles = true {
		dd = instance_create_depth(x,y,depth+1,oDust); dd.image_alpha = 0.5; dd.image_speed = 1.5; dd.life = 30; if random(1)<0.4 dd.col_start = c_aqua;
		timer_set("poof_trail",5);
	}
	//activate collision after X steps
	if y > ystart+TILE_SIZE*2 {
		active = true;
	}
}
#endregion

//fade arrows/bullets
if timer_get("arrow_fade") = 0 {
	if image_alpha > 0 {image_alpha-=0.1; timer_set("arrow_fade",5);} else
	{
	instance_destroy(); //instance_change(oHitSpark,1);
	}
}


//collision wall
if (place_meeting(x,y,oWallParent)) && active = true 
	{		
		if timer_get("arrow_fade") <0 {timer_set("arrow_fade",60);}
		spd = 0; layer_add_instance("Tiles_1",id); depth+=1; vsp = 0;
		dd = instance_create_depth(x,y,depth,oBulletImpactEffect);
		
		if visual = true {
			//sprite_index = sArrowInWall;
			image_angle = direction+wiggle; 
			active = false;
		}
		else instance_destroy(); 		 		
	
	#region play sound when hitting wall
	if (place_meeting(x,y,oWallParent)) && !audio_is_playing(snFootstep4)  {
		audio_sound_gain(snFootstep4,0.4,0);
		audio_play_sound(snFootstep4,0,0);	
	} 
			
	
	}


//collision targets
var _hsp = lengthdir_x(spd,direction);
if (place_meeting(x,y,pShootable)) && active = true
	{
	#region play sound
		//script to run specific sound? 
		if !audio_is_playing(snd_bulletHit)
		{
			audio_sound_gain(snd_bulletHit,0.2,0);
			audio_play_sound(snd_bulletHit,3,0);
		}
	#endregion
	
	//freeze frame
	if random(5)<0.2 scrFreezeScreen(40); 
	
	with(instance_place(x,y,pShootable))
	{
		//instance_create_depth(x,y,depth,oBulletImpactEffect);
		var collision = true;
		if object_index == oEnemyShieldBearer
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
			gunkickx = lengthdir_x(3,other.image_angle);
			gunkicky = lengthdir_y(3,other.image_angle);
			if !place_meeting(x+gunkickx,y,oWallParent) x+=gunkickx; gunkickx = 0;
			if !place_meeting(x,y+gunkicky,oWallParent) y+=gunkicky; gunkicky = 0;
		}
		
	}
	//create impact visual + dmg counter
	/*
	instance_create_depth(x,y,depth,oBulletImpactEffect);
	dd = instance_create_depth(x,y,depth-10,oDmgCounter);
	dd.value = damage;
	*/
	instance_destroy();
}
