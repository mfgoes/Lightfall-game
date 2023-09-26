/// @description Insert description here
if sprite_index = spriteSpecial { //ie if shockwave animation
	image_speed = 1;
	state = PlayerStateFree;
	using_ability = 0;
}

if sprite_index = spriteMelee {
	sprite_index = spriteIdle; 	
	using_ability = 0; //reset animations
}