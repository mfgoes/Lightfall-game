if place_meeting(x, y, oPlayer)
{
	with (instance_place(x, y, oPlayer))
	{
		hp-=other.damage;
		flash = 3;
		hitfrom = x - other.x;
		gunkickx = cos(degtorad(other.direction))*6;
		ScreenShake(3,20);
		
		if hp < 1 KillPlayer();
	}
}

instance_destroy();