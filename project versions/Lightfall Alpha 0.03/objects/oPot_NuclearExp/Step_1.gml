/// @description Insert description here
// You can write your code in this editor
//gm live 
if (live_call()) return live_result; 

vsp = vsp + grv; 

//Vertical collision
if (place_meeting(x,y+vsp, oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp); 
	}
	vsp = 0;
	
}
y = y + vsp;

if !instance_exists(mywall) && screen_shake = 0 {
	with(mywall) instance_destroy();
	flash = 4;
	image_speed = 0.6;
	screen_shake = 1;
	ScreenShake(3,10);
	
	repeat(ceil(random_range(2,3)))		//create dust effect
	{
		with(instance_create_layer(x,bbox_bottom,"Bullets",oDust))
		{vsp = -0.1; image_alpha = 0.3+random(0.3);
		hsp = random_range(-1,1)}
		with (instance_create_layer(x+random_range(-4,4),bbox_top+1-random(4),"Bullets",oPickup_ExpOrb)) //create exp orb
		{hsp = random_range(-3,3)}
	}
}