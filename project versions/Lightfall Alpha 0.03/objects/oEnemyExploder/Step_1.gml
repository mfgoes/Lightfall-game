/// @description destroy self
if global.game_paused
{
	exit;
}

if (hp <= 0 && current_state == enemy_states.patrol) 
{
	if (instance_exists(oPlayer)) {
		global.kills++;	
		global.killsthisroom++;
		with(oGame) killtextscale = 2;
	}
}
