// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateSwing(){
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
				state = PlayerStateFree;
				vsp = -7;
				coyote_time = 0;
			}
			//if coyote_time = 10 {state = pState.normal;}			//leave swing state when touching ground
}