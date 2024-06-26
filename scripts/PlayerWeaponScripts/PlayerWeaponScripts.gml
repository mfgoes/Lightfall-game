
function handlePlayerWeapons() {



#region Initialize Timers
	timer_init("reload_time");
	timer_init("secondary_cooldown");
	timer_init("special_cooldown");
	timer_init("attack_recover");
	timer_init("weapon_display");
	timer_init("poof_trail");
	timer_init("combo_cooldown");
	timer_init("mana_reload");
#endregion

//weapon recoi
weapon_recoil = max(0, weapon_recoil - 0.4);
oPlayer.hascontrol = (timer_get("attack_recover") > 0) ? 0 : 1;

manageManaRecovery();

if oPlayer.state != PlayerStateRoll {	
	calculateAim(); 
	// Handle primary attack (LMB)
	primaryWeaponAttack();  
		
	// Handle secondary attack
	secondaryMeleeAttack(); //make this ie F or middle mouse 
	
	// Re-add long shot here (and add gravity to the shot, and a longer cooldown)
	secondaryBowAttack(); 
	
	}
}


/// @desc Updates the position and angle of the weapon based on player actions and mouse location.
function updateWeaponPositionAndAngle() {
    // Set weapon position and visibility
    x = oPlayer.x - lengthdir_x(3, oPlayer.facing_direction) - lengthdir_x(weapon_recoil, image_angle);
    y = oPlayer.y + 2;

    // Handle weapon angle
    timer_init("change_angle");
    if (oPlayer.key_primary || oPlayer.key_secondary) { //|| oPlayer.key_primary_released
        var mouse_angle = round(point_direction(x, y, mouse_x, mouse_y));
        if (mouse_angle < 90 || mouse_angle > 270) {
            image_angle = aim_360 ? mouse_angle : 0;
        } else {
            image_angle = aim_360 ? mouse_angle : 180;
        }
        timer_set("change_angle", room_speed * 0.5);
    } else if (timer_get("change_angle") <= 0) {
        image_angle = lerp(image_angle, oPlayer.facing_direction, 0.3);
    }

    // Set image angle for player if using mouse
    if (mouse_check_button(mb_left) || mouse_check_button(mb_right)) {
        oPlayer.facing_direction = image_angle;
    }
	
	//camera angle shift is handles in camera object.
	
	//used for weapon stretch animation and non-mouse attacks
	click_dir = sign(mouse_x - oPlayer.x); 
	if click_dir = 0 click_dir = 1; 
}


function calculateAim() {
	// Determine aim angle 
	var closest = instance_nearest(x, y, pShootable);
	var true_aim = (closest != noone) ? point_direction(x, y, closest.x, closest.y - 12) : 90;

	// Decide if the aim is within range based on player's facing direction
	switch(oPlayer.facing_direction) {
		case 0:
			angle_in_range = (true_aim < 45 || true_aim > 315);
			break;
		case 180:
			angle_in_range = (true_aim > 135 && true_aim < 225);
			break;
		default:
			angle_in_range = false;
			break;
	}

	// Set the shoot direction
	if aim_360 {
		shoot_direction = image_angle;
	} else if distance_to_object(closest) < assist_dist && closest != noone && angle_in_range {
		var mask_middle = (closest.bbox_bottom - closest.bbox_top) / 2;
		if sign(closest.x - x) == sign(cos(oPlayer.facing_direction)) &&
			!collision_line(x, y-12, closest.x, closest.y-12, oWallParent, 0, 0) {
			shoot_direction = point_direction(x, y, closest.x, closest.y - mask_middle);
		} else {
			shoot_direction = oPlayer.facing_direction;
		}
	} else {
		shoot_direction = oPlayer.facing_direction;
	}	
}


/// @desc handles animations. ie shooting a bow. Note: this should only activate if there's a bow type weapon. 
function updateBowAnimation() {
	if weapon_active = 1 { //if shooting a bow specifically
	    timer_init("resetShot");

	    if ((mouse_check_button_pressed(mb_left) || mouse_check_button_pressed(mb_right)) && !isShooting) {
	        isShooting = true;
	        image_index = 1;
	        image_speed = 1;
	        timer_set("resetShot", 10);
	    }

	    if (isShooting && !animationEnd) {
	        if (mouse_check_button(mb_left)) {
	            timer_set("resetShot", 10);
	            image_speed = 0;
	            image_index = 1;
	        } else if (mouse_check_button_released(mb_left) || image_index >= 2) {
	            image_index = 2;
	            image_speed = 0;
	            animationEnd = true;
	        }
	    } else if (animationEnd && timer_end("resetShot")) {
	        image_index = 0;
	        image_speed = 0;
	        isShooting = false;
	        animationEnd = false;
	    }
	}
}


/// @desc auto recover stamina over time
/// to do: move this to different parent script
function manageManaRecovery() {
	if oPlayer.mana < global.player1_stamina_max && timer_get("mana_reload") <= 0 {
		oPlayer.mana += 0.25;
		timer_set("mana_reload", 30);
		oPlayer.mana = min(oPlayer.mana, global.player1_stamina_max); // Ensure it doesn't exceed limit
	}
}