/// @desc init
//state enums for simple enemies
enum enemy_states { 
  idle,
  patrol,
  approach,
  attack
}
current_state = enemy_states.idle;

//define sprites (load as arrays and enums in the future (phase 3)
spriteIdle =	sEnemyIdle;
spriteWalk =	sEnemyWalk;
spriteJump =	sEnemyJump;
spriteDie  =	sEnemyDie;
spriteAttack  =	sEnemyIdle
spriteMelee  =	sEnemyIdle
mask_index =	sprite_index;