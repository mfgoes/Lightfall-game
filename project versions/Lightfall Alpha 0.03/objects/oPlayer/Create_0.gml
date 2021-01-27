/// @description Insert description here
//gm live 
if (live_call()) return live_result; 

#region Load basic character data
	hsp = 0;
	vsp = 0;
	grv = 0.5;
	hascontrol = true;
	canjump = 10; //for coyote jump
	speedRoll = 5.0;
	distanceRoll = 100;
	facing_direction = 0; //the last walked in direction
		
	//grappling hook
	grappleX = 0;
	grappleY = 0;
	ropeX = x;
	ropeY = y;
	ropeAngleVelocity = 0; //decide to carry momentum with this later
	ropeAngle = point_direction(grappleX,grappleY, x,y);
	ropeLength = point_distance(grappleX,grappleY,x,y);
	canrope = 0; //allows rope controls
		
	//weapon stuff
	using_ability = 0;
	current_weapon = 0; //0 = bow, 1 = regular
	gunkickx = 2;
	gunkicky = 0;
	flash = 0; 
		
	//misc
	gamepad_on = false; //gamepad
#endregion

#region Load unique player data
	current_character = 0; //archer character
	Load_PlayerStartData(current_character);

	walkspd = PLayerStartData[current_character][0];
	hp_max  = PLayerStartData[current_character][1]; 
	hp = hp_max;
#endregion
	
#region load cooldowns / abilities
	Load_AbilityData(current_character);
	primary_cooldown	= CooldownData[current_character][1];	//15; 
	secondary_cooldown  = CooldownData[current_character][2];	//35;
	third_cooldown		= CooldownData[current_character][3];	//60;		
	roll_cooldown		= CooldownData[current_character][4];	//30; 

	primary_projectile	  = CooldownData[current_character][5];	//oArrow; 
	secondary_projectile  = CooldownData[current_character][6];	//oBullet_BowBash; 
	//special_projectile  = CooldownData[current_character][7];
	//passive_projectile  = CooldownData[current_character][8];

	roll_cooldown_full = roll_cooldown; //when cooldowns are full 
	primary_cooldown_full = primary_cooldown; 
	secondary_cooldown_full = secondary_cooldown;
	third_cooldown_full = third_cooldown;
#endregion

PlayerInput();
state = PlayerStateFree;

#region load sprites
	Load_CharacterData(current_character);
	spriteIdle =	char_sprites[0];
	spriteWalk =	char_sprites[1];
	spriteRoll =	char_sprites[2];
	spriteJump =	char_sprites[3];
	spriteDie  =	char_sprites[4];
	spriteAim  =	char_sprites[6];
	spriteMelee  =	char_sprites[7];
	mask_index =	char_sprites[5]; 	
#endregion