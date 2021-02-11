/// @description change animation
if global.game_paused
{
	exit;
}

if (hp <= 0) 
{
	with (instance_create_layer(x,y,"Enemies",oEnemyCorpse))
	{
		direction = other.hitfrom;	
		hsp = lengthdir_x(1,direction);
		//vsp = lengthdir_y(3,direction)-2;
		if (sign(hsp) !=0)
		sprite_index = other.spriteDie;
		image_xscale = sign(hsp) *other.size;
		image_yscale = other.size;
	}
	instance_destroy();
}
