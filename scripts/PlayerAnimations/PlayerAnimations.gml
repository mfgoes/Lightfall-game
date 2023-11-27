// Script assets have changed for v2.3.0 see
/// @desc Loads sprite sheets. This is useful for future character/skin swapping.
function InitPlayerSprites(){
	spriteIdle    =	sProtagIdle;
	spriteWalk    =	sProtagWalk;
	spriteRoll    =	sProtagRoll;
	spriteJump    =	sProtagJump;
	spriteLanded  = sProtagLandFloor; //27 Nov 2023
	spriteDie     =	sProtagDie;
	spriteAim     =	sProtagAim;
	spriteMelee   =	sPlayerStab; //updated through the sword attack function
	spriteWalkArmed = sProtagWalkArmed;
	spriteIdleArmed = sProtagIdleArmed;
	spriteSpecial =	sProtag_shockwave_playeronly; 
	mask_index    =	sProtagIdle; 	
}


/// @desc changes player animations in different scenarios
function PlayerStepAnimations() {
    if (live_call()) return live_result; 
	// Slow down while aiming weapon -> to do: move this to weapon code instead.
    //to do: split this section. technically not animation related. 
	var slowwalk = 1;
    if (mouse_check_button(mb_left) && grounded) {
        slowwalk = 0.4; // Adjust this value as needed
    } else {
        slowwalk = 1; // 1 = no slow walk
    }

    var animEndMelee = (sprite_index == spriteMelee && image_index >= image_number - 1);

    if !(oPlayerWeapon.using_ability) {
		if (!grounded) {
	        sprite_index = spriteJump;
	        image_speed = 0;
	        if (sign(vsp) > 0) image_index = 1; else image_index = 0;
			
			//check if almost landing 
			if sprite_index = spriteJump && place_meeting(x,y+2,oWallParent) or place_meeting(x,y+2,oPlatformParent) {
						sprite_index = spriteLanded;
						if image_index != 0 image_index = 0; 
						image_speed = 1.2; 
						var sound_land = choose(snFootstep1,snFootstep2,snFootstep3); 
						audio_play_sound(sound_land,2,0,0.4,0,0.8); 
						
						//draw smoke poof
						repeat(3) {
							instance_create_depth(x+random_range(-5,5),y+15,depth-5,oDust);
						}
			}
			
	    } else {
	        if (sprite_index == spriteMelee) {
	            // Check if melee animation has ended
	            if (animEndMelee) {
	                sprite_index = spriteIdle;
	                image_index = 0; // Reset image_index for smooth transition
	            }
	        } else {
	            if (hsp == 0 && !key_left && !key_right) {
					
					//if landing on ground, show 'landing' sprite first. 
					//var grounded_prev = (place_meeting(xprevious, yprevious + 1, oWallParent) || place_meeting(xprevious, yprevious + 1, oPlatformParent));
					if sprite_index != spriteLanded && image_index = 0 { //if reset	
						sprite_index = spriteIdle;
						image_speed = 0.6;						
					}
					
					
		            //if (oPlayerWeapon.image_alpha == 1) 
					//	sprite_index = spriteIdleArmed;
				} 
				else if (animEndMelee) {
		            //sprite_index = spriteIdle;
		            image_speed = 0.6;
					} 
					else {
		            if (sprite_index != spriteWalk && sprite_index != spriteWalkArmed) {
		                image_index = 0; // Reset index.
		            }
		            sprite_index = spriteWalk;
		            image_speed = 1 * slowwalk;
		            if (oPlayerWeapon.image_alpha == 1) sprite_index = spriteWalkArmed;
		            }

				//do we need this?
	            if (hsp == 0 && sprite_index != spriteMelee && sprite_index != spriteIdle  && sprite_index != spriteLanded) {
	                sprite_index = spriteIdle;
	                image_speed = 0.6;
	            }
	        }
	    }
	}

    // Check if rolling
    if (state == PlayerStateRoll) {
        PlayerAnimationRoll(); 
    }
	
	if instance_exists(oPlayerWeapon) {
		if (oPlayerWeapon.using_ability) { 
			PlayerAnimationMelee();	
		}
	}
    
	AfterImages();
}

function PlayerAnimationMelee() {
    // Change player animation
    with (oPlayer) {
        spriteMelee = sPlayerSlash;
        if (oPlayerWeapon.combo_counter % 3 == 2) {
            spriteMelee = sPlayerStab;
        }
		sprite_index = spriteMelee;
        image_speed = 0.8;
    }
	
	oPlayerWeapon.image_alpha = 0; 
}



function PlayerAnimationRoll() {
    // Update Sprite
    sprite_index = spriteRoll;
    var _totalFrames = sprite_get_number(sprite_index);
    image_index = (facing_direction * _totalFrames) + min(((1 - (moveDistanceRemaining / distanceRoll)) * (_totalFrames)), _totalFrames - 1);

    // Change State
    if (moveDistanceRemaining <= 0 || roll_cooldown == 0) {
        sprite_index = spriteIdle;
        state = PlayerStepMovement;
    }
}
