// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	//Horizontal collision
		if (place_meeting(x+hsp,y, oWall))
		{
			while (!place_meeting(x+sign(hsp),y,oWall))
			{
				x = x + sign(hsp); 
			}
			hsp = 0;
			if (state == PlayerStateSwing)
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
		if (state == PlayerStateSwing)
		{
			ropeAngle = point_direction(grappleX,grappleY,x,y);
			ropeAngleVelocity = 0; 
		}
	}
	y = y + vsp;
}