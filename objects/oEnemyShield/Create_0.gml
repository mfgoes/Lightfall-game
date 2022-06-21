event_inherited();
motion_speed = 1;
dir = 0; 
out_of_range = false; 
sight_range = 80 + round(random_range(5,10)); //when to detect player
atk_range = 35; //closest distance for attacks
wander_range = 50; 
damage = 1;
afraid_of_heights = true;
alerted = 0; //if player has already been sighted by this unit.

xprev = x;
yprev = y;
walkspd = .5;
hsp = walkspd;

current_state = enemy_states.patrol;
position_random = random_range(-3,3);
stunned = 5; //prevents enemy from walking

image_speed = 0;

#region animation 
	//define sprites (load flazas arrays and enums in the future (phase 3)
	spriteIdle =	sEnemyShield;
	spriteWalk =	sEnemyShield;
	spriteJump =	sEnemyShield;
	spriteDie  =	sEnemyShield;
	spriteAttack  =	sEnemyShield
	spriteMelee  =	sEnemyShield
	attack_anim_end = 0;
	mask_index =	sprite_index;
	image_alpha = 0.1; //fade in
#endregion
sprite_offset_cleanup();