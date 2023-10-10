/// @description Reset to idle animation
if sprite_index = spriteMelee {
	sprite_index = spriteIdle; 
	image_index = 0; // Reset image_index to 0 to start idle animation from the beginning
	oPlayerWeapon.using_ability = 0; 
}
	

oPlayerWeapon.using_ability = 0; 