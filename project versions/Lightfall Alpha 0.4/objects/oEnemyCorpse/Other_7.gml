/// @description destroy
if global.game_paused
{
	exit;
}

if image_number > 3 { instance_destroy();}
else {
	image_index = 1;
	image_speed = 0;
}