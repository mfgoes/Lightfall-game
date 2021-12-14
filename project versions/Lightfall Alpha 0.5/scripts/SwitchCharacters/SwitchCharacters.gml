// Script assets have changed for v2.3.0 see
//This code allows player to switch between characters (no longer used)
function SwitchCharacters(){
#region //Debug Mode
if (global.debugmode) &&  keyboard_check_pressed(ord("P")) {	//check if in debug mode
	if current_character = 2 current_character = 0;
	else 
	current_character +=1;
	audio_play_sound(snClick,5,0);
	/*
	Load_CharacterData(current_character)
	//Sprites
	spriteIdle =	char_sprites[0] 
	spriteWalk =	char_sprites[1]
	spriteRoll =	char_sprites[2]
	spriteJump =	char_sprites[3]
	spriteDie  =	char_sprites[4]
	spriteAim  =	char_sprites[6]
	spriteMelee  =	char_sprites[7]; //rename this to secondary ability later
	spriteSpecial =	char_sprites[7]; //reuse melee attack in prototype
	mask_index =	char_sprites[5]; //be more specific later; 
	canrope = !canrope;	//toggle rope
	*/
}
#endregion
}