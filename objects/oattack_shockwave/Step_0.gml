/// @description animation flow
#region audio and visual queue

	timer_init("particles_start");
	timer_init("sound2"); 
	timer_init("can_move");

	//set timers
	if timer_get("sound2") < 0
		timer_set("sound2",15);
	if timer_get("can_move") < 0
		timer_set("can_move",30); 

	if sound2 = 0 && timer_get("sound2") = 0 {
		audio_play_sound(mage_m1_cast_fire_v2_01,0,0);
		sound2 = 1;
	}
	
	if timer_get("can_move") = 0 {
		if instance_exists(oPlayer) oPlayer.can_move = true;	//can't move while attacking
	} else {
		oPlayer.hsp = 0; //stop player from moving
		oPlayer.vsp = 0;
	}
	
	ScreenShake(2,20);
	ZoomShake(5,20);
#endregion

#region cause damage to all objects in circle

var _list = ds_list_create();
var _num = collision_circle_list(x, y, dist, pShootable, false, true, _list, false);

if (_num > 0) && timer_get("sound2") = 0 //damage any shootable object in range
{
	for (var i = 0; i < _num; ++i;) with(_list[| i])
	{		
		hp-=other.damage;
		flash = 3;
		hitfrom = other.direction;
		freeze = 60;
		gunkickx = -10*sign(oPlayer.facing_direction);
		if !place_meeting(x+gunkickx,y-4,oWallParent) {
			y-=4;
			x+=gunkickx; 
			gunkickx = 0;
		}
		instance_create_depth(x,y,depth,oBulletImpactEffect);
		//create visual + dmg counter
		instance_create_depth(x,y,depth,oBulletImpactEffect);
		dd = instance_create_depth(x,y,depth-10,oDmgCounter);
		dd.value = other.damage;
	}
	ds_list_destroy(_list);
	
	///FEEDBACK
	var snd_feedback = statue_stomp_02;
	audio_sound_gain(snd_feedback,0.2,0);
	audio_sound_pitch(snd_feedback,choose(1,1.1,1.2));
	if !audio_is_playing(snd_feedback)
	audio_play_sound(snd_feedback,3,0);
	//freeze frame
	scrFreezeScreen(40); 
}

#endregion