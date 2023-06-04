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

// Adjust pickup position to avoid overlapping with nearby pickups
var offsetX = 25; // Adjust this value to set the desired horizontal offset

// Check for nearby pickups
with (oPickupParent) {
    if (!adjusted && abs(x - other.x) < offsetX)  {
        // Move the pickup to the left or right based on the position of the nearby pickup
        if (x < other.x) {
            x -= 5;
        } else {
            x += 5;
        }
        adjusted = true; // Set flag to indicate adjustment has been made
    }
}


//pickup
if place_meeting(x,y,oPlayer) {

	switch (pickup_type) {
		case 0: { //light ammo
			oPlayer.ammo_basic +=5; 
		}
		break;
		case 1: { //heavy ammo. ignore this for first prototype.
			oPlayer.ammo_heavy +=5; 
		}
		break;
		case 2: { //hp small
			oPlayer.hp +=5; 
			if oPlayer.hp > oPlayer.hp_max oPlayer.hp = oPlayer.hp_max; 
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
		dd.str = "+5" 
		dd.toast_type = variant.upgrade; 
	#endregion
}