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
	var trigger = instance_place(x,y,oTransitionTrigger)
	var enemies_alive=false
	if instance_exists(oEnemyParent) { enemies_alive=true }
	if instance_exists(oWaveSystem) {
		if oWaveSystem.room_cleared=false { enemies_alive=true }	
	}
	if trigger>=0 and trigger.active=true and move_transition==0 and enemies_alive=false {
		
		oTransition.mode = TRANS_MODE.TRIGGER; 
		oTransition.trigger_room = trigger.goto_room;
		//move_transition=sign(x-trigger.x) //a small detail that doesn't work for now and is probably a bad idea anyways
		//im keeping it here anyways just incase we would want something like that in the future.
	}
}
