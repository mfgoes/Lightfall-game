///@description Load_CharacterData(character);
///@param character = argument0;
function Load_CharacterData(argument0){
	//char_options = [0, 1]; //1 = placeholder, 2 = huntress, 3 = viking, etc. 
	switch (argument0) {
		case 0: 
			current_character_sprites = [sProtagIdle, sProtagWalk, sArcherRoll, sArcherJump, sArcherDie,sArcherMask, sProtagAim];
			character_weapons = [sGun,0] //main gun, and wether to always display
			break;
		case 1:
			current_character_sprites = [sArcherIdle, sArcherWalk, sArcherRoll, sArcherJump, sArcherDie, sArcherMask, sArcherIdle];
			character_weapons = [sGun,0]
			break;
		case 2: 
			current_character_sprites = [sPlayerIdle, sPlayerWalk, sPlayerRoll, sPlayerJump, sPlayerDie,sPlayerMask, sPlayerIdle];
			character_weapons = [sGun,1]
			break;
	}
}