///@description Load_CharacterData(character);
///@param character = argument0;
function Load_CharacterData(argument0){
	//char_options = [0, 1]; //1 = placeholder, 2 = huntress, 3 = viking, etc. 
	switch (argument0) {
		case 0: 
			current_character_sprites = [sPlayerIdle, sPlayerWalk, sPlayerRoll, sPlayerJump, sPlayerDie,sPlayerMask];
			break;
		case 1:
			current_character_sprites = [sArcherIdle, sArcherWalk, sArcherRoll, sArcherJump, sArcherDie, sArcherMask];
			break;
	}
}