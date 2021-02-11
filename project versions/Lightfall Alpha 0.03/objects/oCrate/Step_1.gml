/// @description Insert description here
// You can write your code in this editor
if global.game_paused
{
	exit;
}

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

if (hp <= 0) instance_destroy();