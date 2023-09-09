/// @description Insert description here
// You can write your code in this editor
if global.game_paused
{
	exit;
}

//gravity + movement
hsp *= 0.6;
x+=hsp;
VerticalCollision(); 

DistributePickupsOnGround(32, 5);


//pickup
if place_meeting(x,y,oPlayer) {

	var ammo_total = 0; 
	
	switch (pickup_type) {
		case 0: { //light ammo
			oPlayerWeapon.ammo_basic +=3; 
			ammo_total = 3; 
		}
		break;
		case 1: { //heavy ammo. ignore this for first prototype.
			oPlayerWeapon.ammo_heavy +=2; 
			ammo_total = 2; 
		}
		break;
		case 2: { //hp small
			oPlayer.hp +=2; 
			if oPlayer.hp > oPlayer.hp_max oPlayer.hp = oPlayer.hp_max; 
			ammo_total = 2; 
		}
		break;
	}
	audio_sound_gain(snEquip,0.1,0);
	audio_sound_pitch(snEquip,random_range(0.8,1));
	audio_play_sound(snEquip,0,0);
	instance_destroy();
	
	#region create toast
		var _x = x; 
		var _y = oPlayer.y-20; 
		dd = instance_create_depth(_x,_y-40,0,oToastUI); 
		dd.str = "+" + string(ammo_total);  
		dd.toast_type = variant.upgrade; 
	#endregion
}