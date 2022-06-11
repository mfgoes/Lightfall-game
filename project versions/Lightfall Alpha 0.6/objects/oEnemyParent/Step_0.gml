 //general gravity
if global.game_paused
{
	exit;
}

//parent timers
//timer_init("attack_reload"); 

//set target
if instance_exists(oPlayer) target = oPlayer; else {
		hsp = 0;
		target = id; 
}

//gravity
VerticalCollision(); 
grounded = (place_meeting(x,y+1,class_wall) or place_meeting(x,y+1,oParPlatform)); //was oWall

//destroy if outside room + fallen
if y > room_height {
	hp = 0;
}

//animation flags (default)
if current_state = enemy_states.attack && timer_get("attack_reload") > 0 {
	sprite_index = spriteAttack;
}
if current_state = enemy_states.approach {
	sprite_index = spriteWalk;
	image_speed = 1;
}
if current_state = enemy_states.idle && hp > 0 {
	if hsp = 0 sprite_index = spriteIdle;
	else sprite_index = spriteWalk;
	image_speed = 1;

}

if hp <= 0 {
	sprite_index = spriteDie;	
	hsp = 0; //prevents flipping
}

if (flash > 0) 
	{
		flash --;
		shader_set(shWhite);
		draw_sprite(sprite_index,image_index,x,y);
		shader_reset();
	} 
