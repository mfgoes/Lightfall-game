/// @description Insert description here
//keep hitbox close to player
if global.game_paused
{
	exit;
}

x = follow.x+lengthdir_x(x_shift,direction);
y = follow.y+3;
