/// @description Insert description here
x = oPlayer.x;
y = oPlayer.y+1;

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
		with (instance_create_layer(x,y,"Bullets",oBullet)) {
			spd = 25;
			direction = other.image_angle+random_range(-1,1);
			image_angle = direction;
		
			x = x - lengthdir_x(4,other.image_angle);
			y = y - lengthdir_y(4,other.image_angle);
		}
	}
	
	if (mouse_check_button(mb_right)) && (firingdelay < 0) || (gamepad_button_check(0,gp_shoulderr)) && (firingdelay < 0)
	{
		firingdelay = 15;
		recoil = 4;
		audio_sound_pitch(snShoot,choose(0.9,0.95,1.0));
		audio_sound_gain(snShoot,0.25,0);
		audio_play_sound(snShoot,5,0);
		ScreenShake(1,5);
		with (instance_create_layer(x,y,"Bullets",oArrow)) {
			spd = 9;
			direction = other.image_angle+random_range(-1,1);
			image_angle = direction;
		
			x = x - lengthdir_x(-5,other.image_angle);
			y = y - lengthdir_y(-5,other.image_angle);
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