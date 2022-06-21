/// @description Insert description here
// You can write your code in this editor
if global.game_paused
{
	exit;
}

vsp = vsp + grv; 

//Vertical collision
VerticalCollision();

if (hp <= 0) instance_destroy();