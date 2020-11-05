// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateRoll(){
	vsp = vsp + grv; 
	hsp = lengthdir_x(speedRoll, 90-image_xscale*90); //changed from roll in facing_direction
		
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);
	
	//Update Sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index);
	image_index = (facing_direction * _totalFrames) + min(((1 - (moveDistanceRemaining / distanceRoll)) * (_totalFrames)), _totalFrames - 1); //less important. fix actual rolling first. 
	
	//Change State
	if (moveDistanceRemaining <= 0) or  roll_cooldown = 0
	{
		state = PlayerStateFree;
	}	
		
	///include animation change too
}

