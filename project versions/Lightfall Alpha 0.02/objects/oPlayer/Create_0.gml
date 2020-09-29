/// @description Insert description here
hsp = 0;
vsp = 0;
grv = 0.4;
walkspd = 4;

//roll
speedRoll = 5.0;
distanceRoll = 120;
facing_direction = 0; //the last walked in direction

controller = 0;
hascontrol = true;
canjump = 10; //for coyote jump

gunkickx = 0;
gunkicky = 0;
//onground = 0;
debugmode = true;

//Sprites
spriteRoll = sPlayerRoll;
spriteIdle = sPlayerIdle;
spriteWalk = sPlayerWalk;
spriteJump = sPlayerJump;
spriteDie = sPlayerDie; 


//Health
hp_max = 4;
hp = hp_max;
flash = 0; 

//rope stuff
grappleX = 0;
grappleY = 0;
ropeX = x;
ropeY = y;
ropeAngleVelocity = 0; //decide to carry momentum with this later
ropeAngle = point_direction(grappleX,grappleY, x,y);
ropeLength = point_distance(grappleX,grappleY,x,y);
canrope = 0; //allows rope controls
//canshoot = 0; //turns to 0 when shooting hook or out of ammo	(ADD LATER)

state = PlayerStateFree;
/*enum pState
{
	normal,	
	swing,
	roll,
}*/

////
audio_sound_pitch(snShoot,choose(0.8,0.6, 0.5));