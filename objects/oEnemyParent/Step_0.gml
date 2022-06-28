 //general gravity
if global.game_paused {
	exit;
}

//parent timers
//timer_init("attack_reload"); 

//set target
if instance_exists(oPlayer)
	target = oPlayer;
else {
	hsp = 0;
	target = id; 
}

//gravity
VerticalCollision(); 
grounded = (place_meeting(x,y+1,oWallParent) or place_meeting(x,y+1,oPlatformParent)); //was oWallParent

//destroy if outside room + fallen
if y > room_height {
	hp = 0;
}

//animation flags (default)
if hp <= 0 {
	sprite_index = spriteDie;	
	hsp = 0; //prevents flipping
}
else if current_state = enemy_states.attack && timer_get("attack_reload") > 0 {
	sprite_index = spriteAttack;
}
else if current_state = enemy_states.approach {
	sprite_index = spriteWalk;
	image_speed = 1;
}
else if current_state = enemy_states.idle && hp > 0 {
	if hsp = 0
		sprite_index = spriteIdle;
	else
		sprite_index = spriteWalk;
	image_speed = 1;
}

effect_flash();
