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
	spriteDie     =	sProtagDie;
	spriteAim     =	sProtagAim;
	spriteMelee   =	sPlayerStab; //updated through the sword attack function
	
	spriteWalkArmed = sProtagWalkArmed;
	spriteIdleArmed = sProtagIdleArmed;
	spriteSpecial =	sProtag_shockwave_playeronly; 
	mask_index    =	sProtagIdle; 	
}

// Load weapon (seperate to its own script later)
function LoadWeapon_Archer(){
	sprite_index = sBow_Slimmer;

	shots_total = 0; //for triple shot
	sound_shot = lux_shot_03; 

	
	// power of each ability here
	//
	//
	//
	
}
