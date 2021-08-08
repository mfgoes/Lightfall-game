/// @desc init
//state enums for simple enemies
enum enemy_states { 
  idle,
  patrol,
  approach,
  attack
}
current_state = enemy_states.idle;
				
//define sprites (load flazas arrays and enums in the future (phase 3)
spriteIdle =	sEnemyExploder;
spriteWalk =	sEnemyExploder;
spriteJump =	sEnemyExploder;
spriteDie  =	sPlayerDie;
spriteAttack  =	sEnemyExploder
spriteMelee  =	sEnemyExploder
attack_anim_end = 0;
mask_index =	sprite_index;
image_alpha = 0.1; //fade in

hp = 4; hp_max = hp;
flash = 0;
vsp = 0;
//grv = 0.3;
walkspd = 2;
hsp = walkspd;
hitfrom = 0;
size = 1;
afraid_of_heights = true;
grounded = false;
if instance_exists(oPlayer) target = oPlayer; else target = self; 


//attacking variables
sight_range = 80 + round(random_range(5,10)); //when to detect player
gunkickx = 0;
atk_range = 35; //closest distance for attacks
wander_range = 50; 
damage = 1;
alerted = 0; //if player has already been sighted by this unit.