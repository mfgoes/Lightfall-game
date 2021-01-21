/// @description
//gm live 
if (live_call()) return live_result; 

#region disappear after attack
	//init timers
	timer_init("attack_length");
	if timer_get("attack_length") = -1 timer_set("attack_length",20);
	if timer_get("attack_length") = 0 instance_destroy(); 
#endregion

#region collision
	if (place_meeting(x,y,pShootable))
	{
		with(instance_place(x,y,pShootable))
		{
			hp--;
			flash = 3;
			hitfrom = other.direction;
		}
		instance_destroy();
	}
	
#endregion

//keep hitbox close to player
{
x = follow.x + x_shift;
y = follow.y;
}
