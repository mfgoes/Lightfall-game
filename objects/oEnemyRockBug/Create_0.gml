/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//unique visuals
spriteIdle =	sRockBug;
spriteWalk =	sRockBug;
spriteJump =	sRockBug;
spriteDie  =	sRockBug_Dead;
spriteAttack =	sRockBug;
spriteMelee  =	sRockBug;
mask_index	 =	sRockBug;

//differentiate this monster here
hp = 10; hp_max = hp; 
sight_range = 90
 current_state = enemy_states.patrol;

//shakes enemy when dead
shake_x = 0; 
shake_dir = 1; 
timer_set("player_sight", -1); // Initialize the timer
