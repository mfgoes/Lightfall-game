if global.game_paused
{
	exit;
}

//Player game input (KB / Mouse / Gamepad)
PlayerInput();

//Change player state
script_execute(state);	

//Collisions. Make more compact later
PlayerCollision();

PlayerCollision_Gates(); //when walking into level gates and 'arena' gates

PlayerStepAnimations(); 

//For testing player death
PlayerDieDebug(); 