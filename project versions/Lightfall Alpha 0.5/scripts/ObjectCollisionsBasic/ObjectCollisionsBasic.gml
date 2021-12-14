// Script assets have changed for v2.3.0 see
// this is for basic objects / boxes. May be expanded in the future to enemies. 
//It's a lot simpler than player collisions (keep it seperate). 
function VerticalCollision(){
	 
var grv = 0.3;
vsp = vsp + grv;
if (place_meeting(x,y+vsp, oWall)) or (place_meeting(x,y+vsp, oWallEnemies)) or (place_meeting(x,y+vsp,oParPlatform))
{
	vsp = 0;	
}
y = round(y + vsp);
if vsp > 12 vsp = 12;
}
//reusable vertical collisions (for enemies)

//limig g to 12 later 