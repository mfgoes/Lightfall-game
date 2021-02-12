/// @description

if (live_call()) return live_result; 
/// @description
if global.game_paused
{
	exit;
}

timer_init("smokeline");
timer_init("detonate");




if timer_get("detonate") = -1 timer_set("detonate",30);
if timer_get("detonate") = 0 && (explode = false) {
	image_speed = 1;
	ScreenShake(5,5);
	explode = true
} 

if timer_get("detonate") > 0 {
if spd > 0 g += 0.1; else g = 0; 
y+=g;
} else {
	spd = 0;
	g = 0; 
}

#region movement + wiggle
	x+= lengthdir_x(spd,direction);
	y+= lengthdir_y(spd,direction);

if spd > 0 image_angle = point_direction(xprevious,yprevious,x,y);

#endregion

#region smoke particles
	if timer_get("smokeline") = -1 && spd > 0 repeat(random_range(1,3)) {
		timer_set("smokeline",random_range(1,3));
		with(instance_create_layer(x+random_range(-2,2),y+random_range(-1,1),"Bullets",oDust)) {
		image_alpha = random_range(0.1,0.3); vsp = -0.3; hsp = random_range(0.5,-0.5);
		image_xscale = random_range(0.6,1) image_yscale = image_xscale;
		image_speed = random_range(0.3,0.5);
		}
	}
#endregion


#region collision  enemy
	if (place_meeting(x,y,pShootable)) && active = true 
	{
		with(instance_place(x,y,pShootable))
		{
			hp--;
			flash = 3;
			hitfrom = other.direction;
		}
		instance_destroy();
		instance_create_depth(x,y,depth,oBulletImpactEffect);
	}
#endregion

//arrow sticks to walls + disappears
	if (place_meeting(x,y,oWall))
	{
		spd = 0; g = 0;
		active = false; 
	}