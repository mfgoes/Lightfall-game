/// @desc follow enemy

if global.game_paused
{
	exit;
}

x = owner.x;
y = owner.y;

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);

if (instance_exists(oPlayer)) 
{
	if (oPlayer.x < x) image_yscale = -image_yscale;
	if (point_distance(oPlayer.x,oPlayer.y,x,y) < 600) && distance_to_object(oPlayer)<shoot_range
	{
		image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
		countdown--; 
	}
	if (countdown<= 0)
	{
		if (!collision_line(x,y,oPlayer.x,oPlayer.y,oWall,false,false))
		{
			countdown = countdownrate+choose(0,2,4);
			audio_sound_pitch(snShoot,choose(0.7,0.9));
			audio_sound_gain(snShoot,0.1,0);
			audio_play_sound(snShoot,5,0);
			ScreenShake(1,10);
			with (instance_create_layer(x,y,"Bullets",oEbullet)) 
			{
			spd = 7;
			direction = other.image_angle+random_range(-1,1);
			image_angle = direction;
		
			x = x - lengthdir_x(4,other.image_angle);
			y = y - lengthdir_y(4,other.image_angle);
			}
		}
	}
}

