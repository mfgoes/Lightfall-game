/// @description do damage

//cause damage to all objects in circle ONCE
var _list = ds_list_create();
var _num = collision_line_list(x, y, x+30*image_xscale,y, pShootable, false, true, _list, false);

if (_num > 0) && active_attack = 1 && instance_exists(oPlayer) //damage any shootable object in range
{	
	for (var i = 0; i < _num; ++i;) with(_list[|i])
	{		
		hp-=other.damage;
		flash = 3;
		freeze = 30;
		hitfrom = other.direction;
		var dir = sign(other.x - oPlayer.x); 
		gunkickx = choose(3,4,6) * dir; //to do: later you can increase the kickback
		gunkicky = choose(0,2); //chance to punch upwards
		if !place_meeting(x+gunkickx,y-4,oWallParent) &&  !place_meeting(x+gunkickx,y-4,oBlockade) {
			y-=2;
			x+=gunkickx;  //initial gunkick
		}
		
		//create visual + dmg counter
		var y_pos = y-20+choose(0,2,4);
		instance_create_depth(x,y_pos,depth,oBulletImpactEffect);
		dd = instance_create_depth(x,y_pos,depth-10,oDmgCounter);
		dd.value = other.damage;
		if other.damage > 4 dd.col_text = c_yellow;
		if other.object_index = oBarrel_Mana dd.counter_type = 1; //don't make it bloody if it's an item. to do: make it for all boxes.
	}
	ds_list_destroy(_list);
	active_attack = 2; //end attack
} 
else 
exit;



#region FEEDBACK / VISUALS
	var snd_feedback = snHitEnemy;
	audio_sound_gain(snd_feedback,0.2,0);
	audio_sound_pitch(snd_feedback,choose(1,1.1,1.2));
	if !audio_is_playing(snd_feedback)
	audio_play_sound(snd_feedback,3,0);
	scrFreezeScreen(5); 
	ScreenShake(2,5);
#endregion


