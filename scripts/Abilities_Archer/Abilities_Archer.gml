///ABILITIES

/*
Cleaned up in 2022.4. 
*/

function Ability_Primary_Archer() { //POWER SHOT
	//if(live_call()) return live_result;
	var key_attack_pressed		= oPlayer.key_primary;
	var key_primary_released	= oPlayer.key_primary_released;
	
	 // Charge Strength + VFX
	if (key_attack_pressed && timer_get("primary_cooldown") = -1) {
        if (!place_meeting(x, y+1, oWallParent) && !place_meeting(x, y+1, oPlatformParent))
            oPlayer.air_shot = true;
        
        if (weapon_charge = 0 && oPlayer.ammo_heavy > 0) {
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
    }
    else {
        oPlayer.air_shot = false;
    }

	
	#region Primary Fire Logic
		if (key_primary_released) && timer_get("primary_cooldown") = -1  && oPlayer.ammo_heavy > 0 {
	    // Recoil
	    with(oPlayer) {
	        var dir = lengthdir_x(-8, oPlayerBow.image_angle);
	        if !place_meeting(x+dir, y-1, oWallParent) && !(oPlayer.grounded)
	            x += dir;
	        if !(oPlayer.grounded) 
				vsp = -jump_speed;
	        ammo_heavy -= 1;
	    }
    
	    timer_set("primary_cooldown", primary_cooldown);
	    oUIElements.primary_cooldown = 0; //for UI purposes
	    audio_sound_gain(snBlaster, 0.35, 0);
	    audio_sound_pitch(snBlaster, choose(0.9, 0.93, 1));
	    audio_play_sound(snBlaster, 2, 0);
    
	    // Create projectile
	    var _dist = 10; 
	    var _x = x + lengthdir_x(_dist, image_angle);
	    var _y = y + lengthdir_y(_dist, image_angle);
		
	    with (instance_create_layer(_x, _y, "Bullets", oArrow)) { //with (instance_create_layer(x, y, "Bullets", oBullet)) {
	        direction = oPlayerBow.shoot_direction;
        
	        // Variable damage
	        if oPlayerBow.weapon_charge >= oPlayerBow.weapon_charge_max * 0.8 {
	            damage = 6;
	            super_arrow = true;
	            audio_sound_pitch(snDartGun2, 1);
	        }
	        else if oPlayerBow.weapon_charge >= oPlayerBow.weapon_charge_max * 0.45 {
	            damage = 4;
	        }
	        else {
	            damage = 3;
	        }
		}
		
		// Reset weapon
		weapon_charge = 0;
        gunkickx = lengthdir_x(-2, other.image_angle - 180);
	    gunkicky = lengthdir_y(-2, other.image_angle - 180);
	    weapon_recoil = 3;
	    ScreenShake(2, 1);
		}   
		else if oPlayer.ammo_heavy = 0 {
		    if (key_primary_released) {
		        audio_play_sound(snd_button2, 0, 0);	
		    }
		    oPlayerBow.weapon_charge = 0; 
		}
	#endregion
}

function Ability_Secondary_Archer() { //TRIPLE SHOT. Edit Oct 1: no longer consumes mana
	
	var key_secondary = oPlayer.key_secondary;
	timer_init("triple_shot");
	
	if (key_secondary = true) && timer_get("secondary_cooldown") = -1 && oPlayer.ammo_basic > 0 {
			timer_set("secondary_cooldown",secondary_cooldown); 
			oUIElements.secondary_cooldown  = 0; //for UI
			//oPlayer.mana -=2;	//consume 1 mana. //Update 4 sep 2022
			if oPlayer.mana < 0 oPlayer.mana = 0;
			 
			//fix shooting direction temporarily
			direction = oPlayerBow.shoot_direction;		
			oPlayer.dir_prev = oPlayerBow.shoot_direction;	
			//if oPlayer.facing_direction = 180 oPlayer.dir_prev = 178; else oPlayer.dir_prev = 2; //remove dir_perv later?
			
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
		
		if shots_total > 0 && timer_get("triple_shot") <=0 && oPlayer.ammo_basic > 0 {
			timer_set("triple_shot",5);
			
			var _dist = 10; 
		    var _x = x + lengthdir_x(_dist, image_angle);
		    var _y = y + lengthdir_y(_dist, image_angle);
			with (instance_create_layer(_x,_y,"Bullets",oArrow_Triple)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
			
				oPlayer.ammo_basic-=1; 
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
					var dir = lengthdir_x(-8,oPlayerBow.image_angle);
					if (oPlayer.grounded) dir = dir = lengthdir_x(-4,oPlayerBow.image_angle);
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

function Ability_Sword_Attack() {
	if(live_call()) return live_result;
	
	//in this function you can manage combos and refine each attack.
	var dist = sign(device_mouse_x_to_gui(0) - oPlayer.x)*10; 
	//audio
	var pitch = random_range(0.8, 1.2);
	var gain = 0.5;
	var snd = snFootstep3;
	
	dd = instance_create_depth(oPlayer.x + dist, y, depth, oAttack_Sword);	
	dd.image_yscale = 0.7;
	dd.image_xscale = click_dir*0.7;
	if combo_counter % 3 == 2 dd.image_xscale = click_dir*0.8;
	
	//change player animation
	with(oPlayer)
	{
		var dir = lengthdir_x(4,facing_direction);
	    spriteMelee = sPlayerSlash; 
	    if (oPlayerBow.combo_counter % 3 == 2)
	    {
	        spriteMelee = sPlayerStab;
			dir = lengthdir_x(12,facing_direction);
			 gain = 0.85;
			 pitch = 1;
			 
	    }
    
	    sprite_index = spriteMelee;
	    image_index = 0;
	    image_speed = 1; 
	    using_ability = 1;
		
		//recoil
		if !place_meeting(x+dir,y-1,oWallParent) 
			x += dir;
			
	}
	
}

///This is the old one
function PlayerStateMeleeAtk(){	//not for MVP
	timer_init("generate attack")
	sprite_index = spriteMelee; 
	image_speed = 1;
	//hsp = 0;
	var slowwalk = 0; 
	var move = key_right - key_left;
	hsp = (move * slowwalk) + gunkickx;
	vsp = (vsp + grv);
	using_ability = 1;
	//create projectile
	if image_index = 1
	{
		audio_sound_gain(snDartGun2,0.1,0);
			audio_sound_pitch(snDartGun2,choose(0.95,1));
			audio_play_sound(snDartGun2,2,0);
			
			
		with (instance_create_layer(x,y,"Bullets",oAtk_Laser)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
			direction = oPlayerBow.image_angle; //oPlayer.facing_direction;
			x_shift = 5;
			image_angle = direction; follow = oPlayer;
			//x_shift = oPlayerBow.flip_weapon * 10;
		}
	if timer_get("generate attack") = -1 {
		//gunkickx = lengthdir_x(-2,oPlayerBow.image_angle-180);
		timer_set("generate attack",3);
		}
	}
	else gunkickx = 0;
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
			using_ability = 1; //leave this on until ability is over.
		}
	
	}
}



