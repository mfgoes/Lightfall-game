/// @description animation flow
#region timers
	//freeze player
	timer_init("can_move"); 	
	if timer_get("can_move") < 0
		timer_set("can_move",30); 

	//activate attack
	timer_init("activate_attack"); 
	if timer_get("activate_attack") < 0
		timer_set("activate_attack",15);
#endregion

#region move player
	if active_attack = 0 && timer_get("activate_attack") = 0 { //activate attack after timer
			audio_play_sound(mage_m1_cast_fire_v2_01,0,0);
			active_attack = 1; //replace with 
			
		//create particles
		repeat (8) { //to do: create an alternative for oDust to create variety in particles
			with(instance_create_depth(x+random_range(-dist,dist),y+random_range(-dist,dist),depth-20,oDust)) {
				vsp = -2; image_alpha = choose(0.6,1);
				hsp = random_range(-1,1)
				image_xscale = choose (2,-2);
				image_yscale = choose (2,-2);	
			} 
		}
	}

	if instance_exists(oPlayer) {
			if timer_get("can_move") = 0 {
				 oPlayer.can_move = true;	//can't move while attacking
			} else {
				oPlayer.hsp = 0; //stop player from moving
				oPlayer.vsp = 0;
			}
		} else exit;
	ScreenShake(2,20);
	ZoomShake(5,20);
#endregion

#region cause damage to all objects in circle ONCE

var _list = ds_list_create();
var _num = collision_circle_list(x, y, dist, pShootable, false, true, _list, false);

if (_num > 0) && active_attack = 1 //damage any shootable object in range
{
	
	
	
	for (var i = 0; i < _num; ++i;) with(_list[|i])
	{		
		hp-=other.damage;
		flash = 3;
		freeze = 30;
		hitfrom = other.direction;
		gunkickx = -10*sign(oPlayer.facing_direction);
		if !place_meeting(x+gunkickx,y-4,oWallParent) {
			y-=4;
			x+=gunkickx; 
			gunkickx = 0;
		}
		
		//create visual + dmg counter
		instance_create_depth(x,y,depth,oBulletImpactEffect);
		dd = instance_create_depth(x,y,depth-10,oDmgCounter);
		dd.value = other.damage;
	}
	ds_list_destroy(_list);
	
#region FEEDBACK / VISUALS

	var snd_feedback = statue_stomp_02;
	audio_sound_gain(snd_feedback,0.2,0);
	audio_sound_pitch(snd_feedback,choose(1,1.1,1.2));
	if !audio_is_playing(snd_feedback)
	audio_play_sound(snd_feedback,3,0);
	scrFreezeScreen(40); 
	
	
	
#endregion
active_attack = 2; //end attack
} 
else exit;

#endregion