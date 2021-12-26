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

//clean up enemy offsets (it's currentlly pretty messy)
function sprite_offset_cleanup(){
sprite_index = spriteIdle; 
sprite_set_offset(spriteIdle,sprite_width/2,sprite_height);
sprite_set_offset(spriteWalk,sprite_width/2,sprite_height);
sprite_set_offset(spriteJump,sprite_width/2,sprite_height);
sprite_set_offset(spriteDie,sprite_width/2,sprite_height);
sprite_set_offset(spriteAttack,sprite_width/2,sprite_height);
sprite_set_offset(spriteMelee,sprite_width/2,sprite_height);
}