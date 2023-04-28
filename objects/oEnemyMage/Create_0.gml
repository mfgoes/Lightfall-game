/// @desc create enemy weapon
//define sprites (load as arrays and enums in the future (phase 3)
event_inherited();

hp = 4; hp_max = hp;
afraid_of_heights = true;
current_state = enemy_states.patrol;


motion_speed = 1;
dir = 0; 
out_of_range = false; 
sight_range = 180 + irandom(10); //when to detect player
atk_range = 160; //closest distance for attacks
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

//animations
spriteIdle		=	sCrowMage_Idle;
spriteWalk		=	sCrowMage_Walk;
spriteAttack	=	sCrowMage_Attack;
spriteDie		=	sCrowMage_Idle; //0 means don't create a corpse
attack_anim_end =	0; //figure out a better system for this later
mask_index		=	sprite_index;
