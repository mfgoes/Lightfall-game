// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	//Horizontal collision
		if (place_meeting(x+hsp,y, oWallParent))
		{
			while (!place_meeting(x+sign(hsp),y,oWallParent))
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
		x = clamp(x + hsp,sprite_width*0.25,room_width-sprite_width*0.25)
		
	//Vertical collision
	if (place_meeting(x,y+vsp, oWallParent))
	{
		while (!place_meeting(x,y+sign(vsp),oWallParent))
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
	
	if instance_exists(oPlatformParent) {
		var nearestPlatform = instance_nearest(x,y+1,oPlatformParent);
		if(nearestPlatform.bbox_top > bbox_bottom && vsp>=0){
		    if (place_meeting(x,y+vsp,oPlatformParent)){
		        while(!place_meeting(x,y+sign(vsp),oPlatformParent)){
		            y+=sign(vsp);
		        }
		        vsp = 0;
		}}
	}
	y = y + vsp;
	
}