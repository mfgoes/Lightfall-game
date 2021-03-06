// Player IDLE, WALK, JUMP
function PlayerStateFree(){
	
//Slow down while aiming weapon
var slowwalk = 0.5; 
if current_weapon = 0 && mouse_check_button(mb_left) = true {
slowwalk = 0.5;
} 
else
slowwalk = 1; //1 = no slow walk

var move = key_right - key_left;
hsp = (move * walkspd * slowwalk) + (gunkickx);
vsp = (vsp + grv) + gunkicky; 

gunkickx = 0; 
gunkicky = 0;


//jumping code
if (place_meeting(x,y+1,oWall)) {
	coyote_time = 15; //coyote. rename this later. 
	jumps = jumps_max;	
}

if (key_jump) && (jumps > 0) {
	vsp = -jump_speed;
	jumps -=1;
}

if !place_meeting(x,y+1,oWall) && coyote_time = 0 {
	if jumps = jumps_max jumps -=1; 	
}

if coyote_time > 0 coyote_time -=1; //this variable is for coyote jump



if hsp < 0 facing_direction = 180 else if hsp > 0 facing_direction = 0;


#region //allow grappling
if canrope = 1 {
		if key_grapple = true
		{
			grappleX = mouse_x;
			grappleY = mouse_y;
			ropeX = x;           
			ropeY = y;
			ropeAngleVelocity = 0; //decide to carry momentum with this later
			ropeAngle = point_direction(grappleX,grappleY, x,y);
			ropeLength = point_distance(grappleX,grappleY,x,y);
			state = PlayerStateSwing;
		}
	}
#endregion

#region jumping pads
	if (place_meeting(x,y+1,oTrampoline)) {
		vsp -=8; 	
	}
#endregion


///ANIMATION
	//is jumping
	if (!place_meeting(x,y+1,oWall))	//CHECK IF ON GROUND
	{
		sprite_index = spriteJump;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 2; else image_index = 1;
	}
	else 
	//is walk or idle or 'start jumping'
	{
		if sprite_index == spriteJump && image_index = 2 {
			audio_sound_pitch(snLanding,choose(0.8,1.0,1.2));
			audio_sound_gain(snLanding,0.02,0);
			audio_play_sound(snLanding,4,false);
			repeat(3)		//create dust effect
			{
				with(instance_create_layer(x,bbox_bottom,"Bullets",oDust))
				{vsp = 0; image_alpha = 0.5;}
			}
			}
		if (hsp == 0) && !(key_left or key_right) && using_ability = 0 //Idle animation
		{
			if sprite_index != spriteIdle image_index = 0; //reset index. 
			sprite_index = spriteIdle; image_speed = 0.6;
		}
		else //walk animation
		{
			if sprite_index != spriteWalk image_index = 0; //reset index. 
			sprite_index = spriteWalk; image_speed = 1*slowwalk;			
		}
		//if jump_cooldown_begin = 1 {image_index = 0; sprite_index = spriteJump;}
	}



//footsteps
//ADD LATER: set trigger step for when to make particles dependant on selected character
if sprite_index = spriteWalk && (image_index = 1 or image_index = 3){ 
	repeat(random_range(2,3)) with (instance_create_layer(x,bbox_bottom,"Bullets",oDust)) 
	{vsp = random_range(-0.2,0.2) image_alpha = random_range(0.1,0.27);}
	
	//play footstep sound
	var footstepsound = choose(snFootstep2,snFootstep3,snFootstep4); //,snFootstep2,snFootstep3,snFootstep4
	audio_sound_gain(footstepsound,0.1,0);
	if !audio_is_playing(footstepsound) audio_play_sound(footstepsound,10,0);
	}
}

