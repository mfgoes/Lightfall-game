///@description Load_CharacterData(character);
///@param character = argument0;
function Load_CharacterData(argument0){
	/*INDEX:
	0 = sprite_index; 
	1 = display_on; (if it should always be visible)
	2 = weapon_speed_max;
	3 = weapon_speed_min; (use this for bows and charging weapons)
	4 = weapon_accuracy (randomizes direction)
	5 = primary_projectile; //object for first ability. ex: Bow. 
	6 = secondary_projectile; //object for second ability
	7 = special_ability; 
	*/
	switch (argument0) {
		case 0: //archer character (main)
			char_sprites = [sProtagIdle, sProtagWalk, sArcherRoll, sArcherJump, sArcherDie,sArcherMask, sProtagAim];
			character_weapons = [sWeaponBow_Placeholder,0,10,3,2,oArrow, oBullet_BowBash, oBullet_BowBash] 
			break;
		case 1:
			char_sprites = [sArcherIdle, sArcherWalk, sArcherRoll, sArcherJump, sArcherDie, sArcherMask, sArcherIdle];
			character_weapons = [sGun,1,10,3,2,oBullet_Parent, oBullet_Parent, oBullet_Parent]
			break;
		case 2: //placeholder player
			char_sprites = [sPlayerIdle, sPlayerWalk, sPlayerRoll, sPlayerJump, sPlayerDie,sPlayerMask, sPlayerIdle];
			character_weapons = [sGun,1,10,3,2,oBullet_Parent, oBullet_Parent, oBullet_Parent]
			break;
	}
}

///@description Load_PlayerStartData(character);
///@param character = argument0;
function Load_PlayerStartData(argument0){
	/*INDEX:
	0 = walkSpeed; 
	1 = hp; 
	2 = armor;
	3 = coins;*/
	
	PLayerStartData = [
	[3,8,0,5], //archer
	[4,8,0,5], //char 2
	[5,6,5,5], //char 3
	];
}
	