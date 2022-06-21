///@description Load_CharacterData(character);
///@param character = argument0;
function Load_CharacterData(argument0){
	/*INDEX:	-> Change these into enums later
	Character sprites: 
	0 = Idle
	1 = Walk
	2 = Roll
	3 = Jump
	4 = Die
	5 = Mask
	6 = Aim (remove this)
	7 = Melee (remove this)
	
	Character weapons:
	0 = Primary weapon sprite
	1 = Secondary weapon sprite (if applicable)
	2-9 = ???
	6-8 = projectiles
	*/
	
	switch (argument0) {
		case 0: //archer character (main)
			char_sprites = [sProtagIdle, sProtagWalk, sArcherRoll, sProtagJump, sArcherDie,sArcherMask, sProtagAim, sProtagMelee];
			character_weapons = [sWeaponBow_Placeholder,sGun, 0,12,5,2,oArrow, oAtk_Laser, oAtk_Special] 
			call_ability = [PlayerStateFree,			//None
							PlayerStateFree,			//Bow
							PlayerStateMeleeAtk,		//Laser 2
							PlayerStateSpecialAtk		//Explosion
							];
			break;
		case 1:
			char_sprites = [sArcherIdle, sArcherWalk, sArcherRoll, sArcherJump, sArcherDie, sArcherMask, sArcherIdle, sArcherIdle];
			character_weapons = [sGun,1,10,5,2,oBullet_Parent, oBullet_Parent, oBullet_Parent];
			call_ability = [PlayerStateFree,			//None
							PlayerStateFree,			//Bow
							PlayerStateMeleeAtk,		//Laser
							PlayerStateSpecialAtk		//Explosion
							];
			break;
		case 2: //placeholder player
			char_sprites = [sPlayerIdle, sPlayerWalk, sPlayerRoll, sPlayerJump, sPlayerDie,sPlayerMask, sPlayerIdle, sPlayerIdle];
			character_weapons = [sGun,1,10,3,2,oBullet_Parent, oBullet_Parent, oBullet_Parent];
			call_ability = [PlayerStateFree,			//None
							PlayerStateFree,			//Bow
							PlayerStateMeleeAtk,		//Laser
							PlayerStateSpecialAtk		//Explosion
							];
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
	[3,8,0,5], //archer 0
	[4,8,0,5], //char 1
	[5,6,5,5], //char 2
	];
}
	