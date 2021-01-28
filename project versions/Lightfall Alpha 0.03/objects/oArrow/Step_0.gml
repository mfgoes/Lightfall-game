/// @description
timer_init("smokeline");
timer_init("arrow_fade");
timer_init("arrow_wiggle");

#region movement + wiggle
	x+= lengthdir_x(spd,direction);
	y+= lengthdir_y(spd,direction);

	if g < 120 {
		g += 0.1; 
	}
	if  timer_get("arrow_fade") >= 0 {
		g = 0;
		}
	else {
		y+= g;
		image_angle = point_direction(xprevious,yprevious,x,y);
	}
if timer_get("arrow_wiggle") > 0 {
	wiggle = max(wiggle,wiggle-1);
	image_angle += random_range(-wiggle,wiggle)*0.5;
}
#endregion

#region smoke particles
	if timer_get("smokeline") = -1 && spd > 0 repeat(random_range(1,3)) {
		timer_set("smokeline",random_range(1,3));
		with(instance_create_layer(x+random_range(-2,2),y+random_range(-1,1),"Bullets",oDust)) {
		image_alpha = random_range(0.1,0.3); vsp = -0.3; hsp = random_range(0.5,-0.5);
		image_xscale = random_range(0.2,0.6) image_yscale = image_xscale;
		image_speed = random_range(0.3,0.5);
		}
	}
	
#endregion

#region collision
	if (place_meeting(x,y,pShootable)) && active = true
	{
		with(instance_place(x,y,pShootable))
		{
			hp--;
			flash = 3;
			hitfrom = other.direction;
			ScreenShake(2,10);
			//play sound
			audio_sound_gain(snFootstep3,0.4,0);
			if !audio_is_playing(snFootstep3) audio_play_sound(snFootstep3,5,0);
		}
		instance_destroy();
	}
	
	//arrow sticks to walls + disappears
	if (place_meeting(x,y,oWall)) && (image_index !=0)
	{
		spd = 0; g = 0; layer_add_instance("Tiles_1",id); depth+=1;
		active = false; 
		if  timer_get("arrow_fade") = -1 {
			timer_set("arrow_fade",60);
			timer_set("arrow_wiggle",6);
			wiggle = 7; 
		}
	//arrow fade
	if timer_get("arrow_fade") = 0 {
		if image_alpha > 0 {image_alpha-=0.1; timer_set("arrow_fade",5);} else
		{
		instance_destroy(); //instance_change(oHitSpark,1);
		}
	}
	}
	
#endregion
