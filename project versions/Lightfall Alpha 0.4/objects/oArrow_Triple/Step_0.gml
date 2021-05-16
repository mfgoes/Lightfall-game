/// @description

if (live_call()) return live_result; 
/// @description
if global.game_paused
{
	exit;
}
//create visual trail
timer_init("poof_trail");
timer_init("poof_trail_close");

if spd > 0 { //check if in wall
	//gravity + movement
	if vsp < 20 vsp+=grv;
	x+= lengthdir_x(spd,direction);
	y+= lengthdir_y(spd,direction)+vsp;

	//poof 
	if timer_get("poof_trail") <= 1 {
		dd = instance_create_depth(x,y,depth+1,oDust); dd.hsp = 0; dd.vsp = 0; dd.image_alpha = 0.5; dd.image_speed = 1.5; dd.life = 30; if random(1)<0.4 dd.col_start = c_aqua;
		timer_set("poof_trail",1);
	}
} else vsp = 0;

if spd > 0 {
	image_angle = point_direction(xprevious,yprevious,x,y); angle_prev = image_angle
}
else image_angle = angle_prev+angle_randomize;


//collision wall
if (place_meeting(x,y,oWall)) 
	{
		dd = instance_create_depth(x,y,depth,oBulletImpactEffect);
		instance_destroy();
	}
	
//collision targets
var _hsp = lengthdir_x(spd,direction);
if (place_meeting(x,y,pShootable)) && active = true
{
	with(instance_place(x,y,pShootable))
	{
		instance_create_depth(x,y,depth,oBulletImpactEffect);
		var collision = true;
		if object_index == oEnemyShield
		{
			collision = false;
			var _dir = image_xscale == 1 ? -1 : 1;
			if sign(_hsp) != _dir
			{
				collision = true;
			}
		}
			
		if collision
		{
			hp--;
			flash = 3;
			hitfrom = other.direction;
		}
	}
	instance_destroy();
}
