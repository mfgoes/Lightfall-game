// This runs when player collides with a battle gate

//	CLEAN UP THIS CODE LATER (2022.4)
function PlayerCollision_Gates(){	
	var gate = instance_place(x,y,oBattleGate);
	if gate != noone
	{
		
			var dir = gate.move_dir*4; 
			gate.touched_gate = true; //activate gate
			if place_meeting(x,y,oBattleGateWall) x+=dir;
		
			with(oEnemyGateControl ) { //check all spawners when this happens
				if gate_left.touched_gate = true or gate_right.touched_gate = true {
					touched_gate = true;
					gate_left.touched_gate = true;
					gate_right.touched_gate = true;
			
				//start enemy spawner. Set wave amount, etc. 
				if alarm[2] = -1 alarm[2] = 20; //spawn an enemy
				}
			}
	
	}
	
}
