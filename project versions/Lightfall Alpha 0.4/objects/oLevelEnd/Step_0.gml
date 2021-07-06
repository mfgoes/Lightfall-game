/// @description Insert description here
//gm live 
if (live_call()) return live_result; 

//activated
if random(1) < 0.05
part_particles_create(global.partSystem, x+random_range(-12,12), y-5, global.ptBasic, 1);	


//go to next level
/// @description move to next room
if place_meeting(x,y-1,oPlayer)
{
	with (oPlayer) 
	{
		if (hascontrol) && (key_up) //if confirming portal
		{
			hascontrol = false;
			SlideTransition(TRANS_MODE.GOTO,other.target);
		}
	}
	if !instance_exists(oCamFollow) instance_create_depth(x,y-sprite_height*0.9,depth,oCamFollow);
}
else 
if instance_exists(oCamFollow) with(oCamFollow) instance_destroy(); 