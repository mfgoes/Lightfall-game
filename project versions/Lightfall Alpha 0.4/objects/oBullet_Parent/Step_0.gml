/// @description Insert description here
if global.game_paused
{
	exit;
}

timer_init("poof_trail");
timer_init("poof_trail_close");

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
