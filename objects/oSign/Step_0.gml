if global.game_paused
{
	exit;
}


if instance_exists(oPlayer) {
	if distance_to_object(oPlayer) < TILE_SIZE && (!instance_exists(oText))
	{
		nearby = true;
		if (keyboard_check_pressed(ord("W"))) or (automatic_sign = true && activated = false) 
		{
			with(instance_create_layer(x,y-24,layer,oText))
			{
				text = other.text;
				length = string_length(text);
			}
			activated = true; 
	
			with (oCamera)
			{
				follow = other.id;	
			}
		}
	} else nearby = false; 
}

//hover effect
direction+=0.1;
hover += cos(direction)/2;