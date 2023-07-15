/// @description Insert description here
/*if global.game_paused
{
	exit;
}*/

timer_init("poof_trail");
timer_init("poof_trail_close");
timer_init("arrow_fade");

//fade arrows/bullets
if timer_get("arrow_fade") = 0 {
	if image_alpha > 0 {image_alpha-=0.1; timer_set("arrow_fade",5);} else
	{
	instance_destroy(); //instance_change(oHitSpark,1);
	}
}

//collision wall
if (place_meeting(x,y,oWallParent)) && (image_index !=0) && active = true
	{
		if timer_get("arrow_fade") <0 {timer_set("arrow_fade",180);}
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
//var target = place_meeting(x,y,pShootable))

if (place_meeting(x,y,pShootable)) && (active)
	{	
	with(instance_place(x,y,pShootable))
	{
		instance_create_depth(other.x,other.y,depth,oBulletImpactEffect);
		var collision = true;
		if object_index == oEnemyShieldBearer
		{
			collision = false;
			var _dir = image_xscale == 1 ? -1 : 1;
			if sign(_hsp) != _dir
			{
				collision = true;
			}
		}
			
		if collision && hitID != other.id
		{
			hp-=other.damage;
			flash = 3;
			//freeze frame
			scrFreezeScreen(40); 
			
			//sound
			play_bullet_impact(); 
			
			//hit counter
			instance_create_depth(other.x,other.y,depth,oBulletImpactEffect);
			dd = instance_create_depth(other.x,other.y,depth-10,oDmgCounter);
			dd.value = other.damage;
		
			hitfrom = other.direction;
			hitID = other.id; //avoids being hit by the same object if not destroyed yet. Reset hitID to zero after X frames.
			
			if object_get_parent(object_index) = oEnemyParent {	//check if attacking an enemy or random object
				gunkickx = lengthdir_x(3,other.image_angle);
				gunkicky = -3;
				if !place_meeting(x+gunkickx,y,oWallParent) x+=gunkickx; gunkickx = 0;
				if !place_meeting(x,y+gunkicky,oWallParent) y+=gunkicky; gunkicky = 0;
			
				//set a short freeze attribute + shot that enemy is hit
				//freeze = other.freeze;
				flinch_anim = 10; 
			}
		}
		
	}
	
	//destroy self
	if break_on_hit = true {
		instance_destroy();	
	}
	else exit; 
}


