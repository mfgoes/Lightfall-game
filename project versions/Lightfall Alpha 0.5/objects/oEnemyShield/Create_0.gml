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

/*enum enemy_states { 
  idle,
  patrol,
  approach,
  attack
}*/
current_state = enemy_states.patrol;

position_random = random_range(-3,3);
stunned = 5; //prevents enemy from walking

image_speed = 0;
image_index = 0;

sprite_offset_cleanup();