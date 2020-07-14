/// @description Insert description here
hsp = 0;
vsp = 0;
grv = 0.4;
walkspd = 4;

controller = 0;
hascontrol = true;
canjump = 10; //for coyote jump
onground = 0;


//rope stuff
state = 0;	//use this for swinging1
grappleX = 0;
grappleY = 0;
ropeX = x;
ropeY = y;
ropeAngleVelocity = 0; //decide to carry momentum with this later
ropeAngle = point_direction(grappleX,grappleY, x,y);
ropeLength = point_distance(grappleX,grappleY,x,y);

enum pState
{
	normal,	
	swing
}

////
audio_sound_pitch(snShoot,choose(0.8,0.6, 0.5));