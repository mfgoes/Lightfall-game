/// @description create walls if player enters
if instance_exists(oPlayer) {
			
	if place_meeting(x,y,oPlayer) {
		oPlayer.has_control = false;
		var dir = sign(other_gate.x - x)* oPlayer.walkspd;	
		if !place_meeting(oPlayer.x+dir,y,oWall)
		oPlayer.x += dir; else oPlayer.x -= sprite_width; //otherwise move player completely
		touched_gate = true; //only activate this if gate is active
		other_gate.touched_gate = true;
	}
	else {
		var i = -sprite_height; 
		var stack = 0;
		oPlayer.has_control = true;	
		if touched_gate = true 
		repeat(10) //create a stack of collisions
		{
			 if !instance_place(x,y+stack,oBattleGateWall) 
				instance_create_depth(x,y+stack,depth,oBattleGateWall);
			stack += i; 
		}
	}
} 

if keyboard_check_released(vk_down) gate_active = true; 
//while touching player, set Control to false and walk player forward. 

