/// @description Insert description here

#region //Debug Mode
if (debugmode) {	//check if in debug mode
	key_db_canrope = keyboard_check_pressed(ord("P")) //|| keyboard_check(
	
	if (key_db_canrope) 
	{
		canrope = !canrope;	//toggle rope
		audio_sound_gain(snClick,0.3,0);
		audio_play_sound(snClick,5,0);
	}
}
#endregion

#region //Get Player Input




if (hascontrol)
{
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space) //|| keyboard_check(ord("W"))
	key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
	key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
	

	if (key_left) || (key_right) || (key_jump)
	{
		controller = 0;	
	}

	if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
	{
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));	
		key_right = max(gamepad_axis_value(0,gp_axislh),0);
		controller = 1;
	}

	if (gamepad_button_check_pressed(0,gp_face1))
	{
		key_jump = 1;                          
		controller = 1;
	}
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}
#endregion


#region //Calculate Movement
	
switch (state)
{
	case pState.normal:
	{
		var move = key_right - key_left;
		hsp = move * walkspd;
		vsp = vsp + grv; 
  		if canjump > 0 canjump -=1;
		if (canjump > 0) && (key_jump)
		{
			vsp = -7;
			canjump = 0;
		}
	
	#region //grappling hook
	if canrope = 1 {
			if (mouse_check_button_pressed(mb_left))
			{
				grappleX = mouse_x;
				grappleY = mouse_y;
				ropeX = x;
				ropeY = y;
				ropeAngleVelocity = 0; //decide to carry momentum with this later
				ropeAngle = point_direction(grappleX,grappleY, x,y);
				ropeLength = point_distance(grappleX,grappleY,x,y);
				state = pState.swing;
		
		
			}
		}
	#endregion
	} break;
	
	case pState.swing:
	{
		var _ropeAngleAcceleration = -0.25 * dcos(ropeAngle); //store how quickly player is accelerating
		_ropeAngleAcceleration += (key_right - key_left) * 0.08; //manual rope acceleration
		
		if (place_meeting(x,y+1, oWall)) {key_down = 0};	//only allow shorter rope if on ground.
		ropeLength += (key_down - key_up) * 2; 
		ropeLength = clamp (ropeLength, 0, 120);
			
		ropeAngleVelocity += _ropeAngleAcceleration;
		ropeAngleVelocity = clamp (ropeAngleVelocity,-8,8); // max speed for rope 
		
		ropeAngle += ropeAngleVelocity;
		ropeAngleVelocity *= 0.996 //0.99; //dampener. set to 1 for infinite swing
		
		ropeX = grappleX + lengthdir_x(ropeLength,ropeAngle);
		ropeY = grappleY + lengthdir_y(ropeLength,ropeAngle);

		hsp = ropeX - x;
		vsp = ropeY - y;
		 
		//leave the swing state
		if (key_jump) 
		{
			state = pState.normal;
			vsp = -7;
			canjump = 0;
		}
		//if canjump = 10 {state = pState.normal;}			//leave swing state when touching ground
		
	}break;
}
	
		//Horizontal collision
		if (place_meeting(x+hsp,y, oWall))
		{
			while (!place_meeting(x+sign(hsp),y,oWall))
			{
				x = x + sign(hsp); 
			}
			hsp = 0;
			if (state == pState.swing)
			{
				ropeAngle = point_direction(grappleX,grappleY,x,y);
				ropeAngleVelocity = 0; //add bounce off wall later
			}
	
		}
		x = x + hsp;
 
		//Vertical collision
		if (place_meeting(x,y+vsp, oWall))
		{
			while (!place_meeting(x,y+sign(vsp),oWall))
			{
				y = y + sign(vsp); 
			}
			vsp = 0;
			if (state == pState.swing)
			{
				ropeAngle = point_direction(grappleX,grappleY,x,y);
				ropeAngleVelocity = 0; 
			}
	
		}
		y = y + vsp;

#endregion
	
	
#region //Animation
	if (!place_meeting(x,y+1,oWall)) 
	{
		sprite_index = sPlayerJump;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
	else 
	{
		canjump = 10;
		
		if (sprite_index == sPlayerJump) {
			audio_sound_pitch(snLanding,choose(0.8,1.0,1.2));
			audio_sound_gain(snLanding,0.2,0);
			audio_play_sound(snLanding,4,false);
			
			repeat(5)		//create dust effect
			{
				with(instance_create_layer(x,bbox_bottom,"Bullets",oDust))
				{
					vsp = 0;
				}
			}
		}
		
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = sPlayerIdle;
		}
		else
		{
			sprite_index = sPlayerWalk;
		}
	}

	if (hsp != 0) image_xscale = sign(hsp);
#endregion