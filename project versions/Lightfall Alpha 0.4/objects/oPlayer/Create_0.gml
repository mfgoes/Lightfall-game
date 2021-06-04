/// @description Insert description here
//gm live 
//if (live_call()) return live_result; 

#region Load basic character data
	hsp = 0;
	vsp = 0;
	grv = 0.32; //gravity
	grounded = false; //check if on ground fast 
	hascontrol = true;
	coyote_time = 10; //for coyote jump
	jump_speed = 6.5;
	jumps = 0; //double jumps
	jumps_max = 2;
	air_shot = false; //allows char to temporarily hover in the air
	slowmotion = 0.4; //delete later. 
	
	speedRoll = 5.0;
	distanceRoll = 170;
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
	enum character {
	archer,
	mage,
	warrior		
	}
	current_character = character.archer; //archer character
	Load_PlayerStartData(current_character);
	
	current_walkspd = 0;
	walkspd = PLayerStartData[current_character][0];
	hp_max  = PLayerStartData[current_character][1]; 
	hp = hp_max;
#endregion
	
#region load cooldowns / abilities
	Load_AbilityData(current_character);
	
	//simplify cooldown script calling
	enum cooldown_ability { 
	  none = 0,
	  primary = 1,	 //arrow
	  secondary = 2, //laser
	  third = 3,	 //roll
	  special = 4	 //explosions
	}
	
	//timers
	primary_projectile	  = CooldownData[current_character][6];	//oArrow; 
	secondary_projectile  = CooldownData[current_character][7];	//oAtk_Melee; 
	third_projectile      = CooldownData[current_character][8]; //oAtk_Special;
	fourth_projectile	  = 0; //add to arrays later
	
	primary_cooldown_full	= CooldownData[current_character][1];	//15; 
	secondary_cooldown_full = CooldownData[current_character][2];	//35;
	third_cooldown_full		= CooldownData[current_character][3];	//60;		
	roll_cooldown_full		= CooldownData[current_character][4];	//30; 
	
	primary_cooldown	= 0;
	secondary_cooldown  = 0;
	third_cooldown		= 0;
	roll_cooldown		= 0;
	
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
	spriteSpecial =	char_sprites[7]; //reuse melee attack in prototype
	mask_index =	sProtagIdle; 	
#endregion


#region create objects
if !instance_exists(oPlayerWeapon) instance_create_depth(x,y,depth,oPlayerWeapon);
#endregion