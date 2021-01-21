/// @description Weapon changes
//gm live 
if (live_call()) return live_result; 

#region init timers
	//cooldown abilities
	timer_init("primary_cooldown");	
	timer_init("secondary_cooldown"); 
	timer_init("special_cooldown");
	timer_init("attack_recover"); //Animation duration while attacking. Players can't walk while attack recovers. 
	
	//other
	timer_init("weapon_zoomed_in");	//stay zoomed in when aiming for a while
	timer_init("recover_from_recoil");
	timer_init("weapon_display");	
#endregion

#region load weapon data from oPlayer -> PRIMARY, SECONDARY, SPECIAL
	//keybinds
	var key_attack_pressed		= oPlayer.key_primary;
	var key_attack_released		= oPlayer.key_attack_released;
	var key_secondary			= oPlayer.key_secondary;
	var key_special				= oPlayer.key_special;
	var key_switch_weapon		= keyboard_check_pressed(ord("E"))
	
	var weapon_speed_max =  oPlayer.character_weapons[2];	//these should be defined within projectile info, not player related.
	var weapon_speed_min =  oPlayer.character_weapons[3];
	var weapon_accuracy  =	oPlayer.character_weapons[4];
	
	var primary_projectile	 =	oPlayer.character_weapons[5]; 
	var secondary_projectile  = oPlayer.character_weapons[6];
	var special_projectile  = oPlayer.character_weapons[7];
	
	
	//swap character weapon
	if (key_switch_weapon)
	{
		oPlayer.current_weapon+=1;
		if oPlayer.current_weapon > 1 oPlayer.current_weapon = 0;
		audio_sound_gain(snSwapWeapon,1,0);
		audio_play_sound(snSwapWeapon,1,0);
	}
#endregion

#region zoom when holding LMB
	if ((key_attack_pressed) && weapon_charge > weapon_charge_max*0.55) {
		weapon_zoom = -0.003;
		}
	else {
		weapon_zoom = 0;
		}		
	if instance_exists(oCamera) {
		oCamera.weapon_zoom = weapon_zoom;
	}
	else exit;
#endregion

#region set weapon pos + visibility
	x = oPlayer.x+(0*oPlayer.image_xscale);
	y = oPlayer.y+2; 
	
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
//recover from gun recoil
if timer_get("recover_from_recoil") = -1 {
	weapon_recoil = max(0,weapon_recoil-1);
}
#endregion

#region weapon recovery: player can after animation pause. Some attacks don't have recovery. 
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
		if key_attack_pressed = true && (weapon_charge < weapon_charge_max) {
			weapon_charge+=0.5;
			weapon_active = 1; 
		}
		if (key_attack_released) //for bow weapons
		{
			oPlayer.primary_cooldown = primary_cooldown_full;
			timer_set("primary_cooldown",primary_cooldown_full);
			audio_play_sound(snDartGun2,2,0);
			audio_sound_gain(snDartGun2,0.2,0);
			//ScreenShake(1,5);
		
			//create the bullet
			with (instance_create_layer(x,y,"Bullets",primary_projectile)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
				direction = other.image_angle+random_range(weapon_accuracy,weapon_accuracy);
				spd = weapon_speed_min+oWeaponPlayer.weapon_charge;
				g = 0.2;
				image_angle = direction;
				x = x - lengthdir_x(0,other.image_angle);
				y = y - lengthdir_y(0,other.image_angle);
			}
			//reset weapon
			weapon_charge = 0; 
			weapon_active = 0; 
			timer_set("weapon_display",room_speed*1); //hide weapon after a second. 
			//gun kickback
			gunkickx = lengthdir_x(1.5,other.image_angle-180);
			gunkicky = lengthdir_y(1, other.image_angle-180);
			}
		}	
	#endregion
	
	#region //secondary
	if (key_secondary = true) && timer_get("secondary_cooldown") = -1 {
		oPlayer.secondary_cooldown = secondary_cooldown_full;
		timer_set("secondary_cooldown",secondary_cooldown_full);
		timer_set("attack_recover",20);
		
		audio_play_sound(snDartGun3,2,0);		
		audio_sound_gain(snDartGun3,0.15,0);
		//gun kickback
		gunkickx = lengthdir_x(1.5,other.image_angle-180);
		gunkicky = lengthdir_y(1, other.image_angle-180);
		
		//create melee attack
			with (instance_create_layer(x,y,"Bullets",secondary_projectile)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
				direction = oPlayer.facing_direction;
				image_angle = direction; follow = oPlayer;
				x_shift = other.flip_weapon * 10;
			}
	}
	#endregion
	
	} 
	//if rolling, don't show weapon
	else weapon_active = 0;
#endregion

