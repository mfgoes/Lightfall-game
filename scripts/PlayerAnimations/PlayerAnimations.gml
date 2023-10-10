// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStepAnimations() {
    // Slow down while aiming weapon -> to do: move this to weapon code instead.
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
	    } else {
	        if (sprite_index == spriteMelee) {
	            // Check if melee animation has ended
	            if (animEndMelee) {
	                sprite_index = spriteIdle;
	                image_index = 0; // Reset image_index for smooth transition
	            }
	        } else {
	            if (hsp == 0 && !key_left && !key_right) {
	                sprite_index = spriteIdle;
	                image_speed = 0.6;
	                if (oPlayerWeapon.image_alpha == 1) sprite_index = spriteIdleArmed;
	            } else if (animEndMelee) {
	                sprite_index = spriteIdle;
	                image_speed = 0.6;
	            } else {
	                if (sprite_index != spriteWalk && sprite_index != spriteWalkArmed) {
	                    image_index = 0; // Reset index.
	                }
	                sprite_index = spriteWalk;
	                image_speed = 1 * slowwalk;
	                if (oPlayerWeapon.image_alpha == 1) sprite_index = spriteWalkArmed;
	            }

	            if (hsp == 0 && sprite_index != spriteMelee && sprite_index != spriteIdle) {
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
        sprite_index = spriteMelee;
        image_speed = 1;
    }
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
