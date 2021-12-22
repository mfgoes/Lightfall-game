// This runs when player collides with a battle gate
function PlayerCollision_Gates(){
	
	var gate = instance_place(x,y,oBattleGate);
	
	if gate != noone
	{	
		if gate.gate_active = true {
			has_control = false;
			var dir = sign(gate.other_gate.x - x)* 4;
			x += dir; //else x -= target.sprite_width; 
		}
		gate.touched_gate = true;
		
		with(oEnemySpawnerNew) { //check all spawners when this happens
			if gate_left.touched_gate = true or gate_right.touched_gate = true {
				touched_gate = true;
				gate_left.touched_gate = true;
				gate_right.touched_gate = true;
			
			//start enemy spawner. Set wave amount, etc. 
			alarm[2] = 20; //spawn an enemy
			}
		}
	}
	
}