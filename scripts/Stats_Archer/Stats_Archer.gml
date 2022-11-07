///General settings for archer character (2022.4)

function LoadCharacter_Archer(){
//load variables specific to this character (scrapped for MVP)

}

// Loads visuals
function LoadAssets_Archer(){
	spriteIdle    =	sProtagIdle;
	spriteWalk    =	sProtagWalk;
	spriteRoll    =	sProtagRoll;
	spriteJump    =	sProtagJump;
	spriteDie     =	sProtagRoll; //update: make new sprite
	spriteAim     =	sProtagAim;
	spriteMelee   =	sProtagIdle;
	spriteSpecial =	sProtag_shockwave_playeronly; 
	mask_index    =	sProtagIdle; 	
}

// Load weapon (seperate to its own script later)
function LoadWeapon_Archer(){
	sprite_index = sWeaponBow_Placeholder;
	weapon_charge = 0; 
	weapon_charge_max = 5;
	shots_total = 0; //for triple shot
	sound_shot = lux_shot_03; 
	weapon_accuracy = 2;
	
	/// COOLDOWNS
	var sec = room_speed; //60
	primary_cooldown	= 40;
	secondary_cooldown  = 50;
	third_cooldown		= 60;
	roll_cooldown		= 40;
	
	// power of each ability here
	//
	//
	//
	
}
