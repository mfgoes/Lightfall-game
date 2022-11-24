/// @desc create enemy weapon
//gm live 
//if (live_call()) return live_result;

event_inherited();


//extras
hp = 25;
hp_max = hp; 

stunned = 5; //prevents enemy from walking 

spriteIdle =	sDummyIdle;
spriteWalk =	sDummyWalk;
spriteJump =	sDummyIdle;
spriteDie  =	sDummyDie;
spriteAttack  =	sDummyIdle;
spriteMelee  =	sDummyIdle;

sprite_offset_cleanup();