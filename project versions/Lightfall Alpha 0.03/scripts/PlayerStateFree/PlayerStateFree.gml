// Player IDLE, WALK, JUMP
function PlayerStateFree(){
var move = key_right - key_left;
hsp = (move * walkspd) + round(gunkickx);
vsp = (vsp + grv) + gunkicky; 
gunkickx = 0; 
gunkicky = 0;

if hsp < 0 facing_direction = 180 else if hsp > 0 facing_direction = 0;
if canjump > 0 canjump -=1; 


if (canjump > 0) && (key_jump) {
	vsp = -7;
	canjump = 0;
}


#region //allow grappling
if canrope = 1 {
		if (mouse_check_button_pressed(mb_middle))
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

///ANIMATION
	//jump sprite
	if (!place_meeting(x,y+1,oWall))	//CHECK IF ON GROUND
	{
		sprite_index = spriteJump;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 2; else image_index = 1;
	}
	else 
	//walk or idle or 'getting ready to jump'
	{
		canjump = 10;
		if sprite_index == spriteJump && image_index = 2 {
			audio_sound_pitch(snLanding,choose(0.8,1.0,1.2));
			audio_sound_gain(snLanding,0.2,0);
			audio_play_sound(snLanding,4,false);
			repeat(3)		//create dust effect
			{
				with(instance_create_layer(x,bbox_bottom,"Bullets",oDust))
				{vsp = 0; image_alpha = 0.5;}
			}
			}
		if (hsp == 0) && !(key_left or key_right) //if not using walk sprite, swith
		{
			if sprite_index != spriteIdle image_index = 0; //reset index. 
			sprite_index = spriteIdle; image_speed = 0.6;
		}
		else
		{
			if sprite_index != spriteWalk image_index = 0; //reset index. 
			sprite_index = spriteWalk; image_speed = 1;			
		}
		//if jump_cooldown_begin = 1 {image_index = 0; sprite_index = spriteJump;}
	
	}

//swap animation xscale

if global.hasgun = true{
	image_xscale = oGun.image_yscale;
}


//footstep sounds + dust
if sprite_index = spriteWalk && (image_index = round(image_number-1) or image_index = round(image_number/2-1)) { 
	repeat(random_range(2,3)) with (instance_create_layer(x,bbox_bottom,"Bullets",oDust))
		{vsp = random_range(-0.1,0.1) image_alpha = 0.3;}
	
	//play footstep sound
	var footstepsound = choose(snFootstep2,snFootstep3,snFootstep4); //,snFootstep2,snFootstep3,snFootstep4
	audio_sound_gain(footstepsound,0.1,0);
	if !audio_is_playing(footstepsound) audio_play_sound(footstepsound,10,0);
	}

}

