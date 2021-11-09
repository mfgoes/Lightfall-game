/// @description create walls if player enters
if instance_exists(oPlayer) {
			
	if place_meeting(x,y,oPlayer) {
		oPlayer.has_control = false;
		var dir = sign(other_gate.x - x)* oPlayer.walkspd;	
		if !place_meeting(oPlayer.x+dir,y,oWall)
			oPlayer.x += dir; else oPlayer.x -= sprite_width; //otherwise move player completely
		touched_gate = true; //only activate this if gate is active
		other_gate.touched_gate = true;
		
		if gate_active = false {
			gate_active = true; 
			other_gate.gate_active = true; //change this to global variable later
			//generate enemy spawner between two gates
			var spawn_x = (x + other_gate.x)/2;
			var bufferzone = sprite_width; 
			spawner = instance_create_depth(spawn_x,y-30,depth,oEnemySpawner);
			//define spawn points
			oEnemySpawner.x_pos1 = x + bufferzone; 
			oEnemySpawner.x_pos2 = other_gate.x - bufferzone; 
			//define spawn commands
			global.wavetotal = 1; 
			spawner.spawn_amount = global.wavetotal;
			
		}
	}
	else {
		var i = -sprite_height; 
		var stack = 0;
		oPlayer.has_control = true;	
		if touched_gate = true && stack_height > 0 { //remove stack var later
			repeat(stack_height) {
			{
			 if !instance_place(x,y+stack,oBattleGateWall) 
				instance_create_depth(x,y+stack,depth,oBattleGateWall);
			stack += i; 
			stack_height = 0
			}
		}
	}

	}
} 

if keyboard_check_released(vk_down) gate_active = false;
//while touching player, set Control to false and walk player forward. 

if (global.wavetotal - global.killsthiswave = 0) && gate_active = true { //replace with 'wavetotal' later
	
	with(oBattleGateWall) instance_destroy();
	gate_active = false; 
}
