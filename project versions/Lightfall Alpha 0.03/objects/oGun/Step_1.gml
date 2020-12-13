/// @description Insert description here
//facing_direction = 180 or 0

//gm live 
//if (live_call()) return live_result; 

x = oPlayer.x+(4*oPlayer.image_xscale);
y = oPlayer.y+2;

#region //determine controller input (mouse or gamepad)
	if (oPlayer.gamepad_on == 0) //if playing with mouse and keyboard
	{
		var mouse_angle = point_direction(x,y,mouse_x,mouse_y);	
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
#endregion

#region /weapon angle and sprites
	if mouse_angle < 90 
		image_angle = clamp(mouse_angle,0,80);
	if mouse_angle > 270
		image_angle = clamp(mouse_angle,280,360);
	if mouse_angle > 90 && mouse_angle < 270 
		image_angle = clamp(mouse_angle,110,260);
		
	if (mouse_angle < 90 or mouse_angle > 270)
		image_yscale = 1;	//face left
	else
		image_yscale = -1; //face right
#endregion

//set current_weapon here. 0 = bow, 1 = SMG, 2 = grappling hook

gun_cooldown = oPlayer.gun_cooldown;
recoil = max(0,recoil-1);

#region //Shoot ammunition 
	if oPlayer.state != PlayerStateRoll 
	//if oPlayer.canrope = 0 
	{
		if (mouse_check_button(mb_left)) && (gun_cooldown < 1) || (gamepad_button_check(0,gp_shoulderrb)) && (gun_cooldown < 1)
		{
			oPlayer.gun_cooldown = gun_cooldown_full;
			recoil = 4;
			//ScreenShake(1,15);
			if (oPlayer.current_weapon = 0) {
				with (instance_create_layer(x,y,"Bullets",oArrow)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
					spd = 10;
					direction = other.image_angle+random_range(-0.5,0.5);
					image_angle = direction;
					x = x - lengthdir_x(2,other.image_angle);
					y = y - lengthdir_y(2,other.image_angle);
				}
				var audio_choose = choose(snDartGun3,snDartGun2,snDartGun3);
				//var audio_choose = snDartGun1;
				audio_sound_gain(audio_choose,0.02,0);
				audio_play_sound(audio_choose,1,0);
			}
			else if (oPlayer.current_weapon = 1) {
				with (instance_create_layer(x,y,"Bullets",oBullet_Parent)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
					spd = 12;
					direction = other.image_angle+random_range(-1,1);
					image_angle = direction;
					x = x - lengthdir_x(2,other.image_angle);
					y = y - lengthdir_y(2,other.image_angle);
				}
				with (oPlayer) //player recoil
				{
					gunkickx = lengthdir_x(1.5,other.image_angle-180);
					gunkicky = lengthdir_y(1, other.image_angle-180);
				}
			}
		}
	x = x - lengthdir_x(recoil,image_angle);
	y = y - lengthdir_y(recoil,image_angle);
	}
#endregion

#region //swap weapons by scrolling
	if keyboard_check_pressed(ord("E"))
	{
		current_weapon+=1;
		if current_weapon > 1 current_weapon = 0;
		audio_sound_gain(snSwapWeapon,0.6,0);
		audio_play_sound(snSwapWeapon,1,0);
	}
#endregion