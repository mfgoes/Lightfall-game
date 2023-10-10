/// @dssc Player Movement Logic
function PlayerStepMovement(){ 	
	// Define solid ground
	grounded = (place_meeting(x, y + 1, oWallParent) || place_meeting(x, y + 1, oPlatformParent));

	//accelerate
	var slowwalk = (mouse_check_button(mb_left) && grounded) ? 0.7 : 1;
	var move = key_right - key_left;
	var decelerate = 0; 
	if move != 0 && current_walkspd < walkspd {current_walkspd +=0.15 decelerate = 0; } 
	
	//decelerate
	if move = 0 { //create fall momentum by decreasing decelleration.
		if current_walkspd > 0 {current_walkspd -=0.15;} else current_walkspd = 0; 
		decelerate = current_walkspd * sign(hsp);
	} else decelerate = 0; 
	
	if can_move = true {
		hsp = (move * current_walkspd * slowwalk) + (gunkickx) + decelerate; 
	}
	
	HandlePlatforming();  //for going up and down platforms
	HandleJumping(); //for normal and double jumping. Also for jumping pads
	PlayerWalkSounds(); //walk sound effects (depending on terrain)
}


function HandleJumping() {
	// Gravity and Jumping
	var slowFall = (air_shot && vsp > 1 && vsp < 12);
	if (slowFall) {
	    vsp = (vsp + grv * slowmotion);
	} else {
	    vsp = (vsp + grv + gunkicky);
	}

	gunkickx = 0;
	gunkicky = 0;

	var canJump = grounded;
	if (canJump) {
	    coyote_time = 8;
	    jumps = jumps_max;
	    jump_pad_jump = false;
	}

	var doubleJump = (key_jump && jumps > 0 && can_move);
	if (doubleJump) {
	    if (jumps > 0 && mana > 1) {
	        var jumpsound = choose(snJump1, snJump2, snJump3);
	        audio_sound_gain(jumpsound, 0.15, 0);
	        audio_play_sound(jumpsound, 0, 0);
	        vsp = -jump_speed;
	        if (jumps == 1) {
	            mana -= 1;
	        }
	        jumps -= 1;

	        // Dust effects
	        repeat(3) {
	            with (instance_create_depth(x, bbox_bottom, depth - 5, oDust)) {
	                vsp = -0.1;
	                hsp = random_range(-2, 2);
	                image_xscale = choose(1, -1);
	                image_yscale = choose(1, -1);
	            }
	        }
	    }
	}

	// Jumping Pads
	var jumpPadCollision = (place_meeting(x, y + 1, oJumpPad));
	if (jumpPadCollision) {
	    var dd = instance_nearest(x, y, oJumpPad);
	    if (dd.active) {
	        vsp = -11;
	        dd.active = false;
	        jumps = jumps_max;
	        dd.alarm[0] = 40;  // Reset jump pad1
	        audio_play_sound(snDartImpact, 0, 0);
	    }
	    jump_pad_jump = true;
	}

	// Trigger Jump Sound and Dust Effects
	var jumpTrigger = (key_jump && grounded);
	if (jumpTrigger) {
	    audio_sound_pitch(snJump1, choose(0.8, 1.0, 1.2));
	    audio_sound_gain(snJump1, 0.1, 0);
	    audio_play_sound(snJump1, 4, false);

	    // Dust effects
	    repeat(3) {
	        with (instance_create_depth(x, bbox_bottom, depth - 5, oDust)) {
	            vsp = 0.1;
	            image_alpha = 0.5;
	            hsp = random_range(-1, 1);
	            image_xscale = choose(1, -1);
	            image_yscale = choose(1, -1);
	        }
	    }

	    vsp = -jump_speed;
	}
}

function AfterImages() {
	timer_init("produce_afterimages");
	//Create after images + feedback
	if air_shot = true && !place_meeting(x,y+1,oWallParent) {
		if timer_get("produce_afterimages") <= 0 {
			timer_set("produce_afterimages",15);
			dd = instance_create_depth(x,y,depth,oPlayer_Afterimage);
			dd.sprite_index = sprite_index; dd.image_index = image_index; dd.image_xscale = dcos(facing_direction);
		}	
	}
}

function HandlePlatforming() {
	// Platforms
	var onPlatform = (place_meeting(x, y + 1, oPlatformParent) && key_down && can_move && !place_meeting(x, y + 1, oWallParent));
	if (onPlatform) {
	    y++;
	}
}

function PlayerWalkSounds() {
	//FUTURE IMPROVEMENTS: Change walk sounds depending on surface
	#region 
		//footsteps 2.0
		if (key_left or key_right) && (grounded) {
		timer_init("walk_sound");
		
		if timer_get("walk_sound") <= 0 {
			timer_set("walk_sound",30);	
		}
		
		var footstepsound = choose(snFootstep2,snFootstep3,snFootstep4); //,snFootstep2,snFootstep3,snFootstep4
		if timer_get("walk_sound") = 1 && !audio_is_playing(footstepsound) {
			audio_sound_gain(footstepsound,0.4*global.sound_volume,0);
			audio_play_sound(footstepsound,1,0);
			repeat(random_range(2,3)) with (instance_create_layer(x,bbox_bottom,"Bullets",oDust)) 
			{vsp = random_range(-0.5,0.3) image_alpha = choose(0.5,0.8,0.9);}
		}
		}
	#endregion
}