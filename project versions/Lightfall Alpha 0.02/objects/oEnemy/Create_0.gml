/// @desc create enemy weapon
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
