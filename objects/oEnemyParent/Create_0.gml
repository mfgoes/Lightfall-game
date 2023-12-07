/// @desc init everything

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

//generate spawn animation
instance_create_depth(x,y,depth,oSpawnAnimation);
alarm[0] = 40;
y = -1000;

// animation related
enum enemy_states { 
	idle,
	patrol,
	approach,
	attack,
	powerattack,
	lunge //new. used for melee enemy 
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
approach_spd = 1.2;
reload_spd = 55;		
	
//patrolling
sight_range = 80 + round(random_range(5,10)); //when to detect player
atk_range = 35; //closest distance for attacks
patrol_dir = choose(1, -1); //which direction to walk into
patrol_xstart = xstart;
patrol_ystart = ystart;
wander_range = 50; 
alerted = 0; //if player has already been sighted by this unit.

//misc 
grounded = false;
target = id; if instance_exists(oPlayer) target = oPlayer;
spawned = false; //this indicates whether oWaveSystem should count this as spawned object. 

//create hitbox
hitbox_w = 20;
hitbox_h = 24;
hitID = 0; 
is_hit = 0; 