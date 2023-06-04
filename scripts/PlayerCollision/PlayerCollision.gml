// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	//Horizontal collision
		if (place_meeting(x+hsp,y, oWallParent)) or (place_meeting(x+hsp,y, oBlockade))
		{
			//if on platform and 'stuck', move up by a pixel
			if (place_meeting(x,y+1, oPlatformParent)) && place_meeting(x+hsp,y,oWallParent) {
				y-=1; 
			}
			
			//if (!place_meeting(x+sign(hsp),y,oWallParent))
			//{
			//	x = x + sign(hsp); 
			//}
			hsp = 0;
			
		}
		x = clamp(x + hsp,sprite_width*0.25,room_width-sprite_width*0.25)
		
	//Vertical collision
	/*
	if instance_exists(oPlatformParent) {
		var nearestPlatform = instance_nearest(x,y+1,oPlatformParent);
		if(nearestPlatform.bbox_top > bbox_bottom && vsp>=0){
		    if (place_meeting(x,y + 1,oPlatformParent)) { //was y + vsp
		        while(!place_meeting(x,y+sign(vsp),oPlatformParent)){
		            y+=sign(vsp);
		        }
		        vsp = 0;
		}}
	}
	*/
	
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
	
	//check for platforms
	if instance_exists(oPlatformParent) {
		var nearestPlatform = instance_nearest(x,y+1,oPlatformParent);
		if(nearestPlatform.bbox_top+3 > bbox_bottom-3 && vsp>=0){
		    if (place_meeting(x,y + 1,oPlatformParent)) { //was y + vsp
				vsp = 0;
		}}
		
		//if (place_meeting(x,y + 1,oPlatformParent))  {vsp = 0;}
	}
	
	y = (y + vsp);
	if (grounded) y = round(y);
}

function PlayerCollision_Gates() {
	if !instance_exists(oBlockade) && instance_exists(oTransitionTrigger) {
		if place_meeting(x,y,oTransitionTrigger) {
			SlideTransition(TRANS_MODE.NEXT);		//go to next level
		}
	}	
}