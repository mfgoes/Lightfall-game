/// @description Weapon changes
//gm live 
//if (live_call()) return live_result; 
if global.game_paused
{
	exit;
}

if (live_call()) return live_result; 

			
				
				
#region init timers
	//cooldown abilities
	timer_init("primary_cooldown");	
	timer_init("secondary_cooldown"); 
	timer_init("special_cooldown");
	timer_init("attack_recover"); //Animation duration while attacking. Players can't walk while attack recovers. 
	timer_init("triple_shot");
	
	//other
	timer_init("weapon_zoomed_in");	//stay zoomed in when aiming for a while
	timer_init("recover_from_recoil");
	timer_init("weapon_display");	
	timer_init("poof_trail");
#endregion

#region load weapon data from oPlayer -> PRIMARY, SECONDARY, SPECIAL
	//keybinds
	var key_attack_pressed		= oPlayer.key_primary;
	var key_attack_released		= oPlayer.key_attack_released;
	var key_secondary			= oPlayer.key_secondary;
	var key_special				= oPlayer.key_special;
	var key_roll				= oPlayer.key_roll;
	var weapon_speed_max		= oPlayer.character_weapons[3];	//these should be defined within projectile info, not player related.
	var weapon_speed_min		= oPlayer.character_weapons[4];
	var weapon_accuracy			= oPlayer.character_weapons[5];
	var primary_projectile		= oPlayer.character_weapons[6]; 
	var secondary_projectile	= oPlayer.character_weapons[7];
	var special_projectile		= oPlayer.character_weapons[8];
#endregion

#region zoom when holding LMB
	/*if ((key_attack_pressed) && weapon_charge > weapon_charge_max*0.55) {
		weapon_zoom = -0.003;
		}
	else {
		weapon_zoom = 0;
		}		
	if instance_exists(oCamera) {
		oCamera.weapon_zoom = weapon_zoom;
	}
	else exit;
	*/
#endregion

#region set weapon pos + visibility
	var shift_y = 0; var shift_x = 0; 
	if sprite_index = oPlayer.character_weapons[1] {shift_y = 2; shift_x = 3;} //organize this better later
	
	x = oPlayer.x - lengthdir_x(shift_x,image_angle) - lengthdir_x(weapon_recoil,image_angle);
	y = oPlayer.y + 3 - lengthdir_y(weapon_recoil,image_angle);
	
	//SET FACING ANGLE
	#region mouse + keyboard
	var mouse_angle = round(point_direction(x,y,mouse_x,mouse_y));	
	if mouse_angle <= 90 
		mouse_angle = clamp(mouse_angle,0,80);
	if mouse_angle > 270
		mouse_angle = clamp(mouse_angle,280,360);
	if mouse_angle > 90 && mouse_angle < 270 
		mouse_angle = clamp(mouse_angle,110,260);
		
	image_angle = round(mouse_angle)
	#endregion
	
#endregion

#region gun recoil
weapon_recoil = max(0,weapon_recoil-1);
#endregion

#region weapon recovery
if timer_get("attack_recover") > 0 {
	oPlayer.hascontrol = 0;
}
else {
	oPlayer.hascontrol = 1;	
}


#endregion

///COOLDOWNS
#region //Cooldown abilities
	if oPlayer.state != PlayerStateRoll && oPlayer.canrope = 0 {
	#region primary
		if timer_get("primary_cooldown") = -1
		{
			if (key_attack_pressed) {
				
				//display animation
				if timer_get("weapon_display") <= 0 or sprite_index != oPlayer.character_weapons[0] { 
					sprite_index = oPlayer.character_weapons[0];
				}
				timer_set("weapon_display",120); 
				if (weapon_charge < weapon_charge_max) 
					weapon_charge+=0.25;
				else if timer_get("poof_trail") <= 1 {
					dd = instance_create_depth(x+lengthdir_x(10,image_angle)+random_range(-2,2),y+lengthdir_y(10,image_angle)+random_range(-3,3),depth-1,oDust); 
					dd.hsp = 0; dd.vsp = 0; if random(1)<0.4 dd.col_start = c_orange; dd.image_alpha = 0.8;
					timer_set("poof_trail",10);
				}
			}
			
			if (key_attack_released) //for bow weapons
			{
				//oPlayer.primary_cooldown = primary_cooldown_full; //(reuse more complex DS afterwards)
				timer_set("primary_cooldown",25);
				audio_sound_gain(HLD_shot_01,0.1,0);
				audio_sound_pitch(HLD_shot_01,choose(0.9,0.95,1));
				audio_play_sound(HLD_shot_01,2,0);
				
				//create projectile
				with (instance_create_layer(x,y,"Bullets",primary_projectile)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
					direction = other.image_angle+random_range(weapon_accuracy,weapon_accuracy);
					
					if  oPlayerWeapon.weapon_charge >= oPlayerWeapon.weapon_charge_max {spd = 7; super_arrow = true;}
					else {spd = 8; super_arrow = false}
					
					image_angle = direction;
					x = x - lengthdir_x(0,other.image_angle);
					y = y - lengthdir_y(0,other.image_angle);
				}			
				//reset weapon
				weapon_charge = 0; 
				//gun kickback
				gunkickx = lengthdir_x(-2,other.image_angle-180);
				gunkicky = lengthdir_y(-2,other.image_angle-180);
				weapon_recoil = 3;
				}	
		}	
	#endregion
	
	#region //secondary attack
		if (key_secondary = true) && timer_get("secondary_cooldown") = -1 {
			timer_set("secondary_cooldown",35);
			
			shots_total = 3; //shoot 3 bullets after each other. This should be pretty satisfying to hear.
			//do sounds later
			
			//gun kickback
			gunkickx = lengthdir_x(-2,other.image_angle-180);
			gunkicky = lengthdir_y(-2,other.image_angle-180);
			weapon_recoil = 3;
			timer_set("weapon_display",120); 
		}
	#endregion
	
	/*
	#region special attack
		if key_special && oPlayer.third_cooldown = 0 {
			//reset weapon
			if timer_get("weapon_display") <= 0 { 
				timer_set("weapon_display",40); 
				//sprite_index = oPlayer.character_weapons[1];
			}
		}
	#endregion*/
	} 
	//if rolling, don't show weapon
	else weapon_active = 0;
#endregion

//execute triple shot
if shots_total > 0 && timer_get("triple_shot") <=0 {
	timer_set("triple_shot",6);
	with (instance_create_layer(x,y,"Bullets",oArrow_Triple)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
	direction = other.image_angle; 
	spd = 7;
					
	image_angle = direction;
	x = x - lengthdir_x(0,other.image_angle);
	y = y - lengthdir_y(0,other.image_angle);
	
	//sound
	sound_shot = lux_shot_05; 
	
	audio_sound_gain(sound_shot,0.1,0); 
	audio_play_sound(sound_shot,2,0);
	}
	shots_total --;
}