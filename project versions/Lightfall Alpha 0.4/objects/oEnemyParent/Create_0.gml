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
mask_index =	sprite_index;

hp = 1;
flash = 0;
vsp = 0;
grv = 0.3;
walkspd = 2;
hsp = walkspd;
hitfrom = 0;
size = 1;
afraid_of_heights = true;
grounded = false;
has_weapon = false;
gunkickx = 0;