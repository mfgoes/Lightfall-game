/// @description Insert description here
//facing_direction = 180 or 0

x = oPlayer.x+(4*oPlayer.image_xscale);
y = oPlayer.y+2;
if (oPlayer.controller == 0)
{
	image_angle = point_direction(x,y,mouse_x,mouse_y);		
}
else 
{
	var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	if (abs(controllerh) > 0.2) || (abs(controllerv) > 0.2)
	{
		controllerangle = point_direction(0,0,controllerh,controllerv);
	}
	image_angle = controllerangle;
}




firingdelay = firingdelay - 1;
recoil = max(0,recoil-1);

if oPlayer.canrope = 0 {
	if (mouse_check_button(mb_left)) && (firingdelay < 0) || (gamepad_button_check(0,gp_shoulderrb)) && (firingdelay < 0)
	{
		firingdelay = 5;
		recoil = 4;
		audio_sound_pitch(snShoot,choose(0.5,0.6,0.7));
		audio_sound_gain(snShoot,0.3,0);
		audio_play_sound(snShoot,5,0);
		ScreenShake(1,10);
		with (instance_create_layer(x,y,"Bullets",oArrow)) { //with (instance_create_layer(x,y,"Bullets",oBullet)) {
			spd = 6;
			direction = other.image_angle+random_range(-1,1);
			image_angle = direction;
			x = x - lengthdir_x(2,other.image_angle);
			y = y - lengthdir_y(2,other.image_angle);
		}
		
	with (oPlayer) 
		{
			gunkickx = lengthdir_x(1.5,other.image_angle-180);
			gunkicky = lengthdir_y(1, other.image_angle-180);
		}
	}

}

x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

//animation and sprites
if (image_angle > 90) && (image_angle < 270) 
{
	image_yscale = -1;	
}
else 
{
	image_yscale = 1;
}