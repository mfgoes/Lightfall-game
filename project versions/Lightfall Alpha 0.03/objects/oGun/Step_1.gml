/// @description Weapon changes
//gm live 
//if (live_call()) return live_result; 

#region init timers
	timer_init("weapon_zoomed_in");	//stay zoomed in when aiming for a while
	timer_init("recover_from_recoil");
	timer_init("weapon_display");	
	timer_init("weapon_putaway");
#endregion

#region zoom when holding LMB
	if ((mouse_check_button(mb_left)) = true && weapon_charge > weapon_charge_max*0.55) {
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

#region set weapon position + angle			//add recoil here again later
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


	/*
	if (oPlayer.gamepad_on == 0) 
		{
			var mouse_angle = round(point_direction(x,y,mouse_x,mouse_y));	
			
			if mouse_angle <= 90 
				image_angle = clamp(mouse_angle,0,80);
			if mouse_angle > 270
				image_angle = clamp(mouse_angle,280,360);
			if mouse_angle > 90 && mouse_angle < 270 
				image_angle = clamp(mouse_angle,110,260);	
			
			if (mouse_angle <= 90 or mouse_angle >= 270)
				image_yscale = 1;	//face left
			else
				image_yscale = -1; //face right
		}
		else 
		{
			var controllerh = gamepad_axis_value(0,gp_axisrh);
			var controllerv = gamepad_axis_value(0,gp_axisrv);
			if (abs(controllerh) > 0.2) || (abs(controllerv) > 0.2)
			{
				var mouse_angle = point_direction(0,0,controllerh,controllerv);
			}
		}
		*/
	#endregion
	
#endregion

#region load weapon data from oPlayer
	//keybinds
	var key_attack_pressed = (mouse_check_button(mb_left)) || (gamepad_button_check(0,gp_shoulderrb));
	var key_attack_released =  (mouse_check_button_released(mb_left)) || (gamepad_button_check_released(0,gp_shoulderrb));
	var key_switch_weapon =	keyboard_check_pressed(ord("E"))
	
	var weapon_speed_max =  oPlayer.character_weapons[2];
	var weapon_speed_min =  oPlayer.character_weapons[3]; //for charging weapons. ie bow
	var weapon_accuracy  =	oPlayer.character_weapons[4];
	var weapon_bullet	 =	oPlayer.character_weapons[5]; 

	var can_shoot = false; 
	if oPlayer.state != PlayerStateRoll && oPlayer.canrope = 0 && gun_cooldown < 1 {
		can_shoot = true;
	}
#endregion

#region gun recoil effects
gun_cooldown = oPlayer.gun_cooldown;
//recover from gun recoil
if timer_get("recover_from_recoil") = -1 {
	weapon_recoil = max(0,weapon_recoil-1);
}
#endregion

#region //Shoot ammunition 
	if can_shoot = true
	{
	//for chargable weapons
	if (key_attack_pressed = true && weapon_charge < weapon_charge_max) {
		weapon_charge+=0.5;
		weapon_active = 1; 
	}
	
	if (key_attack_released && (gun_cooldown < 1))
	{
		oPlayer.gun_cooldown = gun_cooldown_full;
		//weapon_recoil = 0; //use recoil for gun weapons
		timer_set("recover_from_recoil",10);
		
		switch (oPlayer.current_weapon) 
		{
		case 0: 
			{
			var audio_choose = choose(snDartGun3,snDartGun2,snDartGun3);
			audio_sound_gain(audio_choose,0.02,0);
			//ScreenShake(1,5);
			}
			break;
		case 1: 
			{
			var audio_choose = choose(snDartGun3,snDartGun2,snDartGun3);
			ScreenShake(2,10);
			}
		}
		
		//create the bullet
		with (instance_create_layer(x,y,"Bullets",weapon_bullet)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
			direction = other.image_angle+random_range(weapon_accuracy,weapon_accuracy);
			spd = weapon_speed_min+oGun.weapon_charge;
			g = 0.2;
			image_angle = direction;
			x = x - lengthdir_x(0,other.image_angle);
			y = y - lengthdir_y(0,other.image_angle);
		}
		
		//universal bullet variables
		weapon_charge = 0; 
		weapon_active = 0; 
		audio_play_sound(audio_choose,2,0);
		timer_set("weapon_display",room_speed*1); //1 second	
		}
		
		//gun kickback
		gunkickx = lengthdir_x(1.5,other.image_angle-180);
		gunkicky = lengthdir_y(1, other.image_angle-180);
	}
	else weapon_active = 0; //if rolling, don't show weapon
#endregion

#region swap weapons
	if (key_switch_weapon)
	{
		oPlayer.current_weapon+=1;
		if oPlayer.current_weapon > 1 oPlayer.current_weapon = 0;
		audio_sound_gain(snSwapWeapon,1,0);
		audio_play_sound(snSwapWeapon,1,0);
	}
#endregion
