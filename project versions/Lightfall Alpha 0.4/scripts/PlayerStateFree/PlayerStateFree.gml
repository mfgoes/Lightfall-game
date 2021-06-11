// Player IDLE, WALK, JUMP
function PlayerStateFree(){
	
//define solid ground
grounded =(place_meeting(x,y+1,oWall) or place_meeting(x,y+1,oParPlatform));

#region walking
	//Slow down while aiming weapon
	var slowwalk = 0.9; 
	if current_weapon = 0 && mouse_check_button(mb_left) = true  {
	if (grounded = 1) slowwalk = 0.7; else slowwalk = 0.4;
	} 
	else
	slowwalk = 1; //1 = no slow walk

	//accelerate
	var move = key_right - key_left;
	var decelerate = 0; 
	if move != 0 && current_walkspd < walkspd {current_walkspd +=0.4 decelerate = 0; } 
	
	//decelerate
	if move = 0 { //create fall momentum by decreasing decelleration.
		if current_walkspd > 0.4 {if place_meeting(x,y+1,oWall) current_walkspd -=0.3; else current_walkspd -=0.15;} 
		else {current_walkspd = 0; decelerate = 0;}
		decelerate = current_walkspd * sign(hsp);
	} else decelerate = 0; 
	
	
	hsp = (move * current_walkspd * slowwalk) + (gunkickx) + decelerate; 

#endregion

#region platforms
if (place_meeting(x,y+1,oParPlatform) && key_down) {
    y++;
}
#endregion

#region gravity + jumping

	if air_shot = true && vsp > 1 { //slow down the shotvsp = 0 sprite_index = spriteJump && image_index = 1
		if vsp < 12 vsp = (vsp + grv*slowmotion) + gunkicky else vsp = round(vsp);  //only slow-mo on the way down
		//slow down hspeed to avoid crazy leap jumps. 
	}
	else {
		if vsp < 12 vsp = (vsp + grv) + gunkicky else vsp = round(vsp); 
	}
	

	gunkickx = 0; 
	gunkicky = 0;
	//jumping code
	if (grounded = 1) { 
		coyote_time = 8; 
		jumps = jumps_max;	
	}

	if (key_jump) && (jumps > 0) {
		vsp = -jump_speed;
		if jumps <=1 { //double jump sound
			var jumpsound = choose(snJump1,snJump2,snJump3);
			audio_sound_gain(jumpsound,0.15,0);
			audio_play_sound(jumpsound,0,0); 
		}
		jumps -=1;
		repeat(3) {
				with(instance_create_layer(x,bbox_bottom,"Player",oDust)) {
					vsp = -0.1; 
					hsp = random_range(-2,2)
					image_xscale = choose (1,-1);
					image_yscale = choose (1,-1);
				}	
		}
		
		
	}

	if !place_meeting(x,y+1,oWall) && coyote_time = 0 {
		if jumps = jumps_max jumps -=1; 	
	}

	if coyote_time > 0 coyote_time -=1; //this variable is for coyote jump

	if hsp < 0 facing_direction = 180 else if hsp > 0 facing_direction = 0;
#endregion 

#region grappling hook
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

#region jumping pads (needs refinement)
	if (place_meeting(x,y+1,oJumpPad)) {
		var dd = (instance_nearest(x,y,oJumpPad));
		if dd.active = true {
			vsp = -11; dd.active = false; jumps = jumps_max; dd.alarm[0] = 40;  //reset jump pad1
			audio_play_sound(snDartImpact,0,0);
		} 	
	}	
#endregion

#region animations
	//is jumping
	if (!grounded) //CHECK IF ON SURFACE
	{
		sprite_index = spriteJump;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
	else 
	//is walk or idle or 'start jumping'
	{
		if sprite_index == spriteJump && image_index = 1 {
			audio_sound_pitch(snJump1,choose(0.8,1.0,1.2));
			audio_sound_gain(snJump1,0.1,0);
			audio_play_sound(snJump1,4,false);
			repeat(3) {
				with(instance_create_layer(x,bbox_bottom,"Player",oDust)) {
					vsp = 0.1; image_alpha = 0.5;
					hsp = random_range(-1,1); 
					image_xscale = choose (1,-1);
					image_yscale = choose (1,-1);
				}}	
			}
		if (hsp == 0) && !(key_left or key_right) && using_ability = 0 //Idle animation
		{
			if sprite_index != spriteIdle image_index = 0; //reset index. 
			sprite_index = spriteIdle; image_speed = 0.6;
		}
		else //walk animation
		{
			if sprite_index != spriteWalk {
				image_index = 0; //reset index. 
			}
			sprite_index = spriteWalk; image_speed = 1*slowwalk;			
		}
	}

#endregion

#region sound effects (move this somewhere else later)
	//footsteps
	/*
	if sprite_index = spriteWalk && (image_index = 1 or image_index = 4){ 
		repeat(random_range(2,3)) with (instance_create_layer(x,bbox_bottom,"Bullets",oDust)) 
		{vsp = random_range(-0.2,0.2) image_alpha = random_range(0.1,0.27);}
	
		//play footstep sound
		var footstepsound = choose(snFootstep2,snFootstep3,snFootstep4); //,snFootstep2,snFootstep3,snFootstep4
		audio_sound_gain(footstepsound,0.5,0);
		if !audio_is_playing(footstepsound) audio_play_sound(footstepsound,10,0);
		}	*/
#endregion
}