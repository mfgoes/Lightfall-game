/// @description Insert description here
#region //Debug Mode
//gm live 
if (live_call()) return live_result; 

if (debugmode) &&  keyboard_check_pressed(ord("P")) {	//check if in debug mode
	if current_character = 1 current_character = 0;
	else 
	current_character +=1;
	y-=10; //prevents clamming to gorund

switch (current_character) {
	case 0: 
		current_character_sprites = [sPlayerIdle, sPlayerWalk, sPlayerRoll, sPlayerJump, sPlayerDie,sPlayerMask];
		break;
	case 1:
		current_character_sprites = [sArcherIdle, sArcherWalk, sArcherRoll, sArcherJump, sArcherDie, sArcherMask];
		break;
}
//Sprites
spriteIdle =	current_character_sprites[0] 
spriteWalk =	current_character_sprites[1]
spriteRoll =	current_character_sprites[2]
spriteJump =	current_character_sprites[3]
spriteDie  =	current_character_sprites[4]
mask_index =	current_character_sprites[5]; //be more specific later; 

canrope = !canrope;	//toggle rope
audio_sound_gain(snClick,0.3,0);
audio_play_sound(snClick,5,0);
	
}
#endregion

//Player game input (KB / Mouse / Gamepad)
PlayerInput();

//Change player state
script_execute(state);	

//Collisions. Make more compact later + determine better when to call. 
PlayerCollision();

