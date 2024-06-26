///ABILITIES

/*
Cleaned up in 2022.4. 
Updated again 2023.10
*/
function primaryWeaponAttack() {
    // Fetch weapon structure based on the current_weapon
    var weapon_struct = global.weapon_list[current_weapon];
    
    // Ensure that we have a valid weapon structure
    if (!is_struct(weapon_struct)) {
        show_debug_message("Error: Weapon struct not found for current_weapon value: " + string(current_weapon));
        return; // Exit the function to avoid further errors
    }

    // Variables derived from weapon_struct for convenience
    var weapon_damage = weapon_struct.damage;
    var weapon_reload_time = weapon_struct.reload_time;

    // Check if the player is trying to shoot
    if (oPlayer.key_primary) {
		
		//showcase the weapon again
		with(oPlayerWeapon) {
			image_alpha = 1;
			alarm[0] = 120; //hide weapon
		}
		
		
        // Create projectile
        var _dist = 22; 
        var _x = x + lengthdir_x(_dist, image_angle);
        var _y = y + lengthdir_y(_dist, image_angle);
    
        switch (current_weapon) {
            case 0: //just do melee attack if no weapons
				
			break;
			
			case 1: // Bow
                // Handle bow charging and shooting mechanics
                ShootBowCharge(); 
				
                break;
				
			case 2: // Fast gun (short distance)
			if (ammo_basic > 0 && timer_get("reload_time") <= 0) {
                    with (instance_create_layer(_x, _y, "Bullets", oArrow_Triple)) {
                        direction = oPlayerWeapon.shoot_direction + random_range(-10,10);
						randomize(); 
						distance_max = 100 + random(30);  
                        damage = weapon_damage;
						
						//to do: play sound file depending on gun type later
						var pitch = 1; 
					    if damage <= 5 pitch = 1.2;
						if damage > 20 pitch = 0.8;
						angle_randomize = choose(-15,-5,0,5,15);
						audio_sound_pitch(snBlaster, pitch);
						audio_sound_gain(snBlaster, 0.35, 0);
						if damage > 20 audio_sound_gain(snBlaster, 0.5, 0);
					    audio_play_sound(snBlaster, 2, 0);
                    }
                    ammo_basic -= 1;
					weapon_recoil = 3; //amount of visual recoil
                    timer_set("reload_time", weapon_reload_time);
                    oUIElements.reload_time = 0; // Update UI
                }
			break; 
			
			case 3: // Heavy gun (mid distance, slow)
			if (ammo_basic > 0 && timer_get("reload_time") <= 0) {
                    with (instance_create_layer(_x, _y, "Bullets", oArrow_Triple)) {
                        direction = oPlayerWeapon.shoot_direction + random_range(-10,10);
						randomize(); 
						distance_max = 100 + random(30);  
                        damage = weapon_damage;
						
						//to do: play sound file depending on gun type later
						var pitch = 0.7;
						angle_randomize = choose(-15,-5,0,5,15);
						audio_sound_pitch(snBlaster, pitch);
						audio_sound_gain(snBlaster, 0.35, 0);
						if damage > 20 audio_sound_gain(snBlaster, 0.5, 0);
					    audio_play_sound(snBlaster, 2, 0);
                    }
                    ammo_basic -= 1;
					weapon_recoil = 3; //amount of visual recoil
                    timer_set("reload_time", weapon_reload_time);
                    oUIElements.reload_time = 0; // Update UI
                }
			break; 
			
				
				
            default: // Fast gun, Heavy gun, Explosive gun, etc.
                // Shoot if there's ammo and if reload time has passed
                if (ammo_basic > 0 && timer_get("reload_time") <= 0) {
                    with (instance_create_layer(_x, _y, "Bullets", oArrow)) {
                        direction = oPlayerWeapon.shoot_direction;
                        damage = weapon_damage;
						
						//to do: play sound file depending on gun type later
						var pitch = 1; 
					    if damage <= 5 pitch = 1.2;
						if damage > 20 pitch = 0.8;
						audio_sound_pitch(snBlaster, pitch);
						audio_sound_gain(snBlaster, 0.35, 0);
						if damage > 20 audio_sound_gain(snBlaster, 0.5, 0);
					    audio_play_sound(snBlaster, 2, 0);
                    }
                    ammo_basic -= 1;
					weapon_recoil = 3; //amount of visual recoil
                    timer_set("reload_time", weapon_reload_time);
                    oUIElements.reload_time = 0; // Update UI
                }
                
				
				
				break;
        }
        
        // General post-shooting logic, if applicable
        // ...
    }
	 // release to shoot bow
    //ShootBowRelease(); 
}

function secondaryBowAttack() {
	if oPlayer.key_secondary && oPlayer.mana > 3 {
		ShootBowCharge(); 
		oPlayer.can_move = false; 
		oPlayer.hsp = 0; 
	}
	ShootBowRelease();
}


function ShootBowCharge() {
		    if (!place_meeting(x, y+1, oWallParent) && !place_meeting(x, y+1, oPlatformParent))
		        oPlayer.air_shot = true;
        
		    if (weapon_charge = 0 && ammo_basic > 0) {
		        audio_sound_gain(snPrepareBow, 0.1, 0);
		        audio_play_sound(snPrepareBow, 0, 0);
		    }
        
		    timer_set("weapon_display", 120); 
        
		    if (weapon_charge < weapon_charge_max)
		        weapon_charge += 0.25;
			//Create dust effect
		    else if (timer_get("poof_trail") <= 1) {
		        var dd = instance_create_depth(x + lengthdir_x(10, image_angle) + random_range(-2, 2),
		                                        y + lengthdir_y(10, image_angle) + random_range(-3, 3),
		                                        depth - 1, oDust);
		        with (dd) {
					hsp = 0;
					vsp = 0;
					col_start = choose(c_white, c_orange); // Randomize the color choice
					image_alpha = 0.8;
				}
		        timer_set("poof_trail", 10);
		    }
		
		else {
		    oPlayer.air_shot = false;
		}
}

function ShootBowRelease() {
	
	 { //bow if current_weapon = 1
	#region Primary Fire Logic
	var key_secondary_released	= oPlayer.key_secondary_released;
	
		if (key_secondary_released) && timer_get("secondary_cooldown") = -1 &&  oPlayer.mana >= 3 { //  && ammo_basic > 0
			//
			oPlayer.can_move = true;
			
			// Recoil
		    with(oPlayer) {
		        var dir = lengthdir_x(-8, oPlayerWeapon.image_angle);
		        if !place_meeting(x+dir, y-1, oWallParent) && !(oPlayer.grounded)
		            x += dir;
		        if !(oPlayer.grounded) 
					vsp = -jump_speed;
		    }
			//ammo_basic -= 1;    //update 2023: bow doesn't consume ammo but mana. 
			oPlayer.mana -=3; if oPlayer.mana <= 0 oPlayer.mana = 0; 
	    
			timer_set("secondary_cooldown", 50); //to do: use secondary_cooldown instead later
		    oUIElements.reload_time = 0; //for UI purposes
		    audio_sound_gain(snBlaster, 0.35, 0);
		    audio_sound_pitch(snBlaster, choose(0.9, 0.93, 1));
		    audio_play_sound(snBlaster, 2, 0);
    
		    // Create projectile
		    var _dist = 10; 
		    var _x = x + lengthdir_x(_dist, image_angle);
		    var _y = y + lengthdir_y(_dist, image_angle);
		
		    with (instance_create_layer(_x, _y, "Bullets", oArrow)) { //with (instance_create_layer(x, y, "Bullets", oBullet)) {
		        direction = oPlayerWeapon.shoot_direction;
			
        
		        // Variable damage
		        if oPlayerWeapon.weapon_charge >= oPlayerWeapon.weapon_charge_max * 0.8 {
		            damage = 6;
		            super_arrow = true;
		            audio_sound_pitch(snDartGun2, 1);
		        }
		        else if oPlayerWeapon.weapon_charge >= oPlayerWeapon.weapon_charge_max * 0.45 {
		            damage = 4;
		        }
		        else {
		            damage = 3;
					break_on_hit = true; //shooting a weak arrow means it breaks instantly.
				
		        }
			}
		
		// Reset weapon
		weapon_charge = 0;
        gunkickx = lengthdir_x(-2, other.image_angle - 180);
	    gunkicky = lengthdir_y(-2, other.image_angle - 180);
	    weapon_recoil = 3;
	    ScreenShake(2, 1);
		}   
		else if ammo_heavy = 0 {
		    if (key_secondary_released) {
		        audio_play_sound(snd_button2, 0, 0);	
		    }
		    oPlayerWeapon.weapon_charge = 0; 
		}
	#endregion
	}
}


/// @desc secondary attack (short range)
function secondaryMeleeAttack() {
	if oPlayer.key_special && timer_get("special_cooldown") <= 0 {
			Ability_Sword_Attack(); // TODO: change this into a slot later
			//ShootBowCharge(); 
			
			timer_set("special_cooldown", 20); 
			timer_set("combo_cooldown", 50); 
			combo_counter += 1; 
			oPlayerWeapon.using_ability +=1; //this is a flag for the animation end

		}

		// Reset combo counter if cooldown expires
		if timer_get("combo_cooldown") <= 0 {
			combo_counter = 0; 	
	}
}


function Ability_Sword_Attack() {
	if(live_call()) return live_result;
	if oPlayer.mana > 0 with(oPlayer) { //assume this move uses mana instead of ammo
		//in this function you can manage combos and refine each attack.
		mana -= 1;
        var dir = lengthdir_x(4, facing_direction);
		var gain = 0.85;
        var pitch = 1;
		var click_dir = sign(cos(degtorad(facing_direction))); //to do: fix this later
		var dist = 15; //fix
		image_index = 0; 
        //spriteMelee = sPlayerSlash;
		//image_speed = 0.5; 
        if (oPlayerWeapon.combo_counter % 3 == 2) {
            //spriteMelee = sPlayerStab;
            dir = lengthdir_x(5, facing_direction);
            gain = 0.85;
            pitch = 1;
        }
	
		dd = instance_create_depth(oPlayer.x + dist*click_dir, y, depth, oAttack_Sword);	
		dd.image_yscale = 0.7;
		dd.image_xscale = click_dir*0.7;
		dd.damage = choose(3,4,4,5); //to do: allow upgrades of this in the future
		
		if combo_counter % 3 == 2 {
			dd.image_xscale = click_dir*0.8;
				
		}
		 // Apply recoil
        if (!place_meeting(x + dir, y - 1, oWallParent)) {
            x += dir;
            //current_walkspd = 2;
            hsp = 2 * sign(dir);
        }	
	}
}


function Ability_Secondary_Archer() { //TRIPLE SHOT. Edit Oct 1: no longer consumes mana
	
	var key_secondary = oPlayer.key_secondary;
	timer_init("triple_shot");
	
	if (key_secondary = true) && timer_get("secondary_cooldown") = -1 && ammo_basic > 0 {
			timer_set("secondary_cooldown",secondary_cooldown); 
			oUIElements.secondary_cooldown  = 0; //for UI
			//oPlayer.mana -=2;	//consume 1 mana. //Update 4 sep 2022
			if oPlayer.mana < 0 oPlayer.mana = 0;
			 
			//fix shooting direction temporarily
			direction = oPlayerWeapon.shoot_direction;		
			oPlayer.dir_prev = oPlayerWeapon.shoot_direction;	
			
			shots_total = 3; //shoot 3 bullets after each other
			timer_set("triple_shot",5);
			gunkickx = lengthdir_x(-2,other.image_angle-180);
			gunkicky = lengthdir_y(-2,other.image_angle-180);
			weapon_recoil = 3;
			timer_set("weapon_display",120); 
			ScreenShake(2,1);
			
		} else { //play "no ammo" sound
			if (oPlayer.key_secondary_released)
				audio_play_sound(snd_button2,0,0);	
		}
		
		if shots_total > 0 && timer_get("triple_shot") <=0 && oPlayerWeapon.ammo_basic > 0 {
			timer_set("triple_shot",5);
			
			var _dist = 10; 
		    var _x = x + lengthdir_x(_dist, image_angle);
		    var _y = y + lengthdir_y(_dist, image_angle);
			with (instance_create_layer(_x,_y,"Bullets",oArrow_Triple)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
			
				ammo_basic-=1; 
				direction = oPlayer.dir_prev; 
				spd = 7;
				damage = 3; //default = 1;
					
				image_angle = direction;
				//sound
				sound_shot = snBlaster; 
				audio_sound_gain(sound_shot,0.1,0); 
				audio_play_sound(sound_shot,2,0);
			}
			if shots_total = 3 {
			
				//recoil
				with(oPlayer) {
					var dir = lengthdir_x(-8,oPlayerWeapon.image_angle);
					if (oPlayer.grounded) dir = dir = lengthdir_x(-4,oPlayerWeapon.image_angle);
					if !place_meeting(x+dir,y-1,oWallParent) 
						x += dir;
				}
			}
			if !(oPlayer.grounded) oPlayer.vsp = -oPlayer.jump_speed;
			shots_total --;
		} else weapon_active = 0;
			//play "empty bullets sound" when shooting instead
} 	

function Ability_Special_ArrowRain() { //not for MVP
/// @function       Ability_Spread_Archer();
/// @desc			Calls a storm of arrows to rain down around the player
	if timer_get("special_cooldown") = -1 && oPlayer.mana >= 4 { //consumes 5 mana
		timer_set("special_cooldown",third_cooldown);
		oUIElements.third_cooldown  = 0; //for UI
		
		oPlayer.mana -=5;  
		if oPlayer.mana < 0 oPlayer.mana = 0;
		
		instance_create_depth(x,y,depth,oAttack_StormArrows);
		
		//sound
		sound_shot = huntress_R_rain_loop_01; 
		audio_sound_gain(sound_shot,0.3,0); 
		audio_play_sound(sound_shot,2,0);
		
		sound2 = mage_m1_cast_fire_v2_01; 
		audio_sound_gain(sound2,0.1,0); 
		audio_play_sound(sound2,1,0);
		
		
	}
} 	


function Ability_Special_Shockwave() {
	if timer_get("special_cooldown") = -1 && oPlayer.mana >= 4 {
		timer_set("special_cooldown",third_cooldown);
		oUIElements.third_cooldown  = 0; //for UI purposes
		
		oPlayer.mana -=3;  
		if oPlayer.mana < 0 oPlayer.mana = 0;
	
		instance_create_depth(x,y,depth,oAttack_Shockwave);
	
		//change player animation (figure out how best to do this later)
		//oPlayer.spriteSpecial = sProtag_shockwave_playeronly; //set special sprite when "choosing" this special ability later on. 
		with(oPlayer) {
			sprite_index = spriteSpecial;	
			image_speed = 1;
			oPlayerWeapon.using_ability = 1; //leave this on until ability is over.
		}
	
	}
}



