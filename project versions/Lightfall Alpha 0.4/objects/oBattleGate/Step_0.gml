/// @description create walls if player enters
if instance_exists(oPlayer) {
			
	/*
	if place_meeting(x,y,oPlayer) {
		
		//push player inside gate at start
		if (global.wavetotal - global.killsthiswave > 0) {
			oPlayer.has_control = false;
			var dir = sign(other_gate.x - x)* 4;
			if !place_meeting(oPlayer.x+dir,y,oWall)
				oPlayer.x += dir; else oPlayer.x -= sprite_width; //otherwise move player completely
			touched_gate = true; //only activate this if gate is active
			other_gate.touched_gate = true;
		}
		
		if gate_active = false {
			gate_active = true; 
			other_gate.gate_active = true;
			
			//generate enemy spawner
			if other_gate.x > x { //make sure to only create 1 spawner object
				
				var spawn_x = (x + other_gate.x)/2;
				var bufferzone = sprite_width; 
				
				//define spawn points
			spawner.x_pos1 = x + bufferzone; 
			spawner.x_pos2 = other_gate.x - bufferzone; 
			}
			
			
			//define spawn commands
			global.wavetotal = 1; 
			spawner.spawn_amount = global.wavetotal;
			spawner.alarm[0] = 30; 
			
		}
	}
	//generate stack of walls
	else if touched_gate = true { 
		var i = -sprite_height; 
		var stack = 0; 
		oPlayer.has_control = true;	
		repeat(stack_num) {
			if !instance_place(x,y+stack,oBattleGateWall) 
			dd = instance_create_depth(x,y+stack,depth,oBattleGateWall);
			dd.dir = sign(other_gate.x - x)* 4;
			stack += i; 
			stack_num = 0
		}
	}
}

//open back gate + delete stack of walls
if (global.wavetotal - global.killsthiswave = 0) && gate_active = true { //replace with 'wavetotal' later	
	with(oBattleGateWall) instance_destroy();
*/
}

