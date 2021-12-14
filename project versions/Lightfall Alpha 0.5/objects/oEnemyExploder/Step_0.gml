if global.game_paused
{
	exit;
}

grounded = place_meeting(x, y + 1, oWall);

timer_init("destroy");

switch (current_state)
{
	case enemy_states.patrol: {
		// patrol
		
		if ((grounded) && ( ((!place_meeting(x + hsp, y + 1,oWall) && afraid_of_heights))
								or place_meeting(x+hsp,y, oWall) ))
		{
			hsp = -hsp;
		}
		x += hsp;
		
		if (hp <= 0)
		{
			current_state = enemy_states.idle;
			timer_set("destroy", 60);
		}
	} break;
	case enemy_states.idle: {
		//destroy enemy 
		hsp = 0;
		if timer_get("destroy") <= 0
		{
			instance_destroy();
			repeat 20
			{
				var bit = instance_create_layer(x, y, "Bullets", oExplodingBits)
				bit.hspeed = random_range(-5, 5);
				bit.vspeed = random_range(-5, 5);
			}
			instance_create_layer(x, y, "Bullets", oExplosion);
		}
	} break;
}

//gravity
event_inherited();