//gm live 
if (live_call()) return live_result; 
//create visual trail
timer_init("poof_trail");
timer_init("poof_trail_close");

if global.game_paused
{
	exit;
}

if spd > 0 { //check if in wall
	//gravity + movement
	if vsp < 20 vsp+=grv;
	x+= lengthdir_x(spd,direction);
	y+= lengthdir_y(spd,direction)+vsp;

	//poof 
	if timer_get("poof_trail") <= 1 {
		dd = instance_create_depth(x,y,depth+1,oDust); dd.hsp = 0; dd.vsp = 0; dd.image_alpha = 1; dd.image_speed = 0.2;
		timer_set("poof_trail",4+choose(1,2));
	}
	if timer_get("poof_trail_close") <= 1 {
		dd = instance_create_depth(x,y,depth+1,oDust); dd.hsp = 0; dd.vsp = 0; dd.image_alpha = 1; dd.image_speed = 2; 
		if super_arrow = true {dd.image_xscale = 1; dd.image_yscale = 1; dd.col_start = c_orange;}
		timer_set("poof_trail_close",1);
	}
} else vsp = 0;

if spd > 0 {
	image_angle = point_direction(xprevious,yprevious,x,y); angle_prev = image_angle
}
else image_angle = angle_prev+angle_randomize;


timer_init("arrow_fade");

if timer_get("arrow_fade") = 0 {
	if image_alpha > 0 {image_alpha-=0.1; timer_set("arrow_fade",5);} else
	{
	instance_destroy(); //instance_change(oHitSpark,1);
	}
}

//collision wall
if (place_meeting(x,y,oWall)) && (image_index !=0) && active = true
	{
		if timer_get("arrow_fade") <0 {timer_set("arrow_fade",120);}
		spd = 0; layer_add_instance("Tiles_1",id); depth+=1;
		sprite_index = sArrowInWall;
		//mask_index = sArrowInWall;
		active = false; 		
		
		dd = instance_create_depth(x,y,depth,oBulletImpactEffect);
		x+= lengthdir_x(8,direction);
		y+= lengthdir_y(8,direction)+vsp;
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
			hp-=other.damage;
			flash = 3;
			hitfrom = other.direction;
		}
	}
	//create poof + dmg counter
	instance_create_depth(x,y,depth,oBulletImpactEffect);
	dd = instance_create_depth(x,y,depth-10,oDmgCounter);
	dd.value = damage;
	
	instance_destroy();
}
