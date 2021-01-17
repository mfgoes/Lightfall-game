///@description Load_CharacterData(character);
///@param character = argument0;
function Load_CharacterData(argument0){
	
	/*Weapon data info: oPlayer.character_weapons[0];
	INDEX:
	0 = sprite_index; 
	1 = display_on; (if it should always be visible)
	2 = weapon_speed_max;
	3 = weapon_speed_min; (use this for bows and charging weapons)
	4 = weapon_accuracy (randomizes direction)
	5 = weapon_bullet; //ie oArrow;
	*/

	switch (argument0) {
		case 0: //archer character (main)
			current_character_sprites = [sProtagIdle, sProtagWalk, sArcherRoll, sArcherJump, sArcherDie,sArcherMask, sProtagAim];
			character_weapons = [sWeaponBow_Placeholder,0,10,3,2,oArrow] 
			break;
		case 1:
			current_character_sprites = [sArcherIdle, sArcherWalk, sArcherRoll, sArcherJump, sArcherDie, sArcherMask, sArcherIdle];
			character_weapons = [sGun,1,10,3,2,oBullet_Parent]
			break;
		case 2: //placeholder player
			current_character_sprites = [sPlayerIdle, sPlayerWalk, sPlayerRoll, sPlayerJump, sPlayerDie,sPlayerMask, sPlayerIdle];
			character_weapons = [sGun,1,10,3,2,oBullet_Parent]
			break;
	}
}