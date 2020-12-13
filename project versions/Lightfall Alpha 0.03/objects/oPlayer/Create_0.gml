/// @description Insert description here
hsp = 0;
vsp = 0;
grv = 0.4;
walkspd = 3;

//roll
speedRoll = 5.0;
distanceRoll = 100;
facing_direction = 0; //the last walked in direction

//cooldowns
roll_cooldown = 30; roll_cooldown_start = roll_cooldown; //1second. Replace with deltatime later. Replace with 'cooldown_ability1, etc. 
gun_cooldown = 25; //aka firing delay
hook_cooldown = 60;
current_weapon = 0; //0 = bow, 1 = regular

gamepad_on = 0; //gamepad
hascontrol = true;
canjump = 10; //for coyote jump
//jump_anticipation = 2; //2/60frames	jump_cooldown_begin = false;

gunkickx = 2;
gunkicky = 0;
//onground = 0;
debugmode = true;

//character sprite data goes here
current_character = 1;
Load_CharacterData(current_character);

//Sprites
spriteIdle =	current_character_sprites[0] 
spriteWalk =	current_character_sprites[1]
spriteRoll =	current_character_sprites[2]
spriteJump =	current_character_sprites[3]
spriteDie  =	current_character_sprites[4]
mask_index =	current_character_sprites[5]; //be more specific later; 


//Health
hp_max = 4;
hp = hp_max;
flash = 0; 

//rope stuff
grappleX = 0;
grappleY = 0;
ropeX = x;
ropeY = y;
ropeAngleVelocity = 0; //decide to carry momentum with this later
ropeAngle = point_direction(grappleX,grappleY, x,y);
ropeLength = point_distance(grappleX,grappleY,x,y);
canrope = 0; //allows rope controls
//canshoot = 0; //turns to 0 when shooting hook or out of ammo	(ADD LATER)

state = PlayerStateFree;
/*enum pState
{
	normal,	
	swing,
	roll,
}*/

////
audio_sound_pitch(snShoot,choose(0.8,0.6, 0.5));