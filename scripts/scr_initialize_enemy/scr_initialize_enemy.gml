// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_initialize_enemy(){
//define sprites 
spriteIdle = sprite_index;
spriteWalk = sprite_index;
spriteJump = sprite_index;
spriteDie  = sprite_index;
spriteAttack = sprite_index;
spriteMelee = sprite_index;
spriteHit   = sprite_index; 
attack_anim_end = 0;
mask_index = sprite_index;
image_alpha = 0.1; //fade in
atk_anim_x = 0; // for melee attacks
gunkickx = 0;
gunkicky = 0;
flinch_anim = 0;

// animation related
enum enemy_states { 
	idle,
	patrol,
	approach,
	attack,
	powerattack,
	lunge,
	return_to_patrol, //returns to patrol area
}
current_state = enemy_states.idle;

// Enemy type
can_blink = true; //can blink if required. 
afraid_of_heights = true;
size = 1;

// HP and attack
damage = 1;
hp = 4;
hp_max = hp;
flash = 0;
freeze = 0; //This temporarily freezes the enemy. 
stunned = 5; //prevents enemy from walking. to do: what's the difference between freeze and stunned?
hitfrom = 0;

// movement
walk_spd = 1;
hsp = walk_spd;
vsp = 0;
current_spd = 0; // Initialize current speed
approach_spd = 1.2;
wall_close_ahead = false; //for decelerating. 
decelerate_dist = TILE_SIZE;


reload_spd = 55;		
	
//patrolling
sight_range = 90 + round(random_range(5,10)); //when to detect player
atk_range = 55; //closest distance for attacks

atk_check = false;

patrol_dir = choose(1, -1); //which direction to walk into
patrol_xstart = xstart;
patrol_ystart = ystart;
wander_range = 50; 
alerted = 0; //if player has already been sighted by this unit.
maintain_distance = false; //if true, don't approach too much

//misc 
grounded = false;
target = id; if instance_exists(oPlayer) target = oPlayer;
spawned = false; //this indicates whether oWaveSystem should count this as spawned object. 

//create hitbox
hitbox_w = 20;
hitbox_h = 24;
hitID = 0; 
is_hit = 0; 

}