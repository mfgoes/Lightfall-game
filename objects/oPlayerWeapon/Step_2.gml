/// @description abilities + mana management

#region Debugging
	if (live_call()) return live_result; 
	if global.game_paused exit;	
#endregion

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

#region Gun Recoil
	weapon_recoil = max(0, weapon_recoil - 1);
#endregion

#region Weapon Recovery
	oPlayer.hascontrol = (timer_get("attack_recover") > 0) ? 0 : 1;
#endregion

#region Mana Recovery
	if oPlayer.mana < global.player1_stamina_max && timer_get("mana_reload") <= 0 {
		oPlayer.mana += 0.25;
		timer_set("mana_reload", 30);
		oPlayer.mana = min(oPlayer.mana, global.player1_stamina_max); // Ensure it doesn't exceed limit
	}
#endregion

#region Abilities & Attacks
	if oPlayer.state != PlayerStateRoll && oPlayer.canrope == 0 {	
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
		
		// Handle primary attack
		Ability_Primary_Archer(); 	
		
		// Handle secondary attack
		if oPlayer.key_secondary && timer_get("secondary_cooldown") <= 0 {
			Ability_Sword_Attack(); // TODO: change this into a slot later
			timer_set("secondary_cooldown", 20); 
			timer_set("combo_cooldown", 50); 
			combo_counter += 1; 
		}

		// Reset combo counter if cooldown expires
		if timer_get("combo_cooldown") <= 0 {
			combo_counter = 0; 	
		}
	}
#endregion

