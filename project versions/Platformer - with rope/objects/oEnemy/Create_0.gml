/// @desc
if (has_weapon)
{
	mygun = instance_create_layer(x,y,"Gun",oEgun);	
	with (mygun)
	{
		owner = other.id; 
	}
}
else mygun = noone;
