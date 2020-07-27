/// @description Insert description here
hsp = 0;
vsp = 0;
grv = 0.4;
walkspd = 4;

controller = 0;
hascontrol = true;
canjump = 10; //for coyote jump
onground = 0;
debugmode = true;

//rope stuff
state = 0;	//use this for swinging1
grappleX = 0;
grappleY = 0;
ropeX = x;
ropeY = y;
ropeAngleVelocity = 0; //decide to carry momentum with this later
ropeAngle = point_direction(grappleX,grappleY, x,y);
ropeLength = point_distance(grappleX,grappleY,x,y);
canrope = 0; //allows rope controls
//canshoot = 0; //turns to 0 when shooting hook or out of ammo	(ADD LATER)

enum pState
{
	normal,	
	swing
}

////
audio_sound_pitch(snShoot,choose(0.8,0.6, 0.5));