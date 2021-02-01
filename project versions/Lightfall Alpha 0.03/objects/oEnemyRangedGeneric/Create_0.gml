/// @desc create enemy weapon
//define sprites (load as arrays and enums in the future (phase 3)
spriteIdle =	sEnemyIdle;
spriteWalk =	sEnemyWalk;
spriteJump =	sEnemyJump;
spriteDie  =	sEnemyDie;
spriteAttack  =	sEnemyIdle
spriteMelee  =	sEnemyIdle
mask_index =	sprite_index;

if (has_weapon)
{
	mygun = instance_create_layer(x,y,"Gun",oEgun);	
	with (mygun)
	{
		owner = other.id; 
		shoot_range = 200;
	}
}
else mygun = noone;
