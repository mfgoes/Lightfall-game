/// @description Insert description here
//gm live 
if (live_call()) return live_result; 
#region init vars
	hsp = 0;
	vsp = 0;
	grv = 0.5;
	walkspd = 3;
	
	//roll
	speedRoll = 5.0;
	distanceRoll = 100;
	facing_direction = 0; //the last walked in direction
	
	//cooldowns
	roll_cooldown = 30; roll_cooldown_start = roll_cooldown; //1second. Replace with deltatime later. Replace with 'cooldown_ability1, etc. 
	primary_cooldown = 15; //aka firing delay
	secondary_cooldown = 35;
	third_cooldown = 60;
	current_weapon = 0; //0 = bow, 1 = regular

	gamepad_on = 0; //gamepad
	hascontrol = true;
	canjump = 10; //for coyote jump
	//jump_anticipation = 2; //2/60frames	jump_cooldown_begin = false;

	gunkickx = 2;
	gunkicky = 0;
	debugmode = true;
	
	//Health
	hp_max = 10;
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
#endregion

//character sprite data goes here
current_character = 0; //green protag
Load_CharacterData(current_character);

//define player controls at start
PlayerInput();
state = PlayerStateFree;

#region set image data
	spriteIdle =	current_character_sprites[0];
	spriteWalk =	current_character_sprites[1];
	spriteRoll =	current_character_sprites[2];
	spriteJump =	current_character_sprites[3];
	spriteDie  =	current_character_sprites[4];
	spriteAim  =	current_character_sprites[6];
	mask_index =	current_character_sprites[5]; //be more specific later; 
#endregion