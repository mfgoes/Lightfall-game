/// @description follow the enemy
if instance_exists(owner)
{
	x = owner.x;
	y = owner.y-(owner.bbox_bottom - owner.bbox_top)-5;
}
else exit; //static