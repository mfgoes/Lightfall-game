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

timer_init("produce_afterimages");
//Create after images
if air_shot = true && !place_meeting(x,y+1,oWallParent) {
	if timer_get("produce_afterimages") <= 0 {
		timer_set("produce_afterimages",15);
		dd = instance_create_depth(x,y,depth,oPlayer_Afterimage);
		dd.sprite_index = sprite_index; dd.image_index = image_index; dd.image_xscale = dcos(facing_direction);
	}	
}