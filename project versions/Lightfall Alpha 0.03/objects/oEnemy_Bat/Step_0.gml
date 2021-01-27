 /// @desc states

//gm live 
if (live_call()) return live_result; 
if distance_to_point(xstart,ystart) > 50 out_of_range = true else out_of_range = false;

switch (current_state)
{
	//wandering code
	case enemy_states.idle: {
		motion_speed = 0.6;
		//attack player if close by
		if distance_to_object(oPlayer) < sight_range
			current_state = enemy_states.approach;
		
		//move back if too from start point
		if (out_of_range) {
			var randomizer = random(360); 
			targetx = xstart + lengthdir_x(wander_range,randomizer); 
			targety = ystart + lengthdir_y(wander_range,randomizer);
			dir = point_direction(x,y,targetx,targety);
			
			var dx = cos(degtorad(dir))*(motion_speed);
			var dy =-sin(degtorad(dir))*(motion_speed);
			x+=dx;
			y+=dy;
			}
			//move back if out of range
			//decelerate
			/*
			if distance_to_point(targetx,targety) < wander_range*0.33 {
				motion_speed = lerp(motion_speed,0.5,0.25); }
			//accelerate
			if distance_to_point(targetx,targety) > wander_range*0.66 {
				motion_speed = lerp(motion_speed,1,0.25); }
			*/
			else {
			//reset point on circle: 
			if distance_to_point(targetx,targety) < 1 {
			var randomizer = random(360); 
			targetx = xstart + lengthdir_x(wander_range,randomizer); //+ random_range(-dist_extra,dist_extra); //set new target point
			targety = ystart + lengthdir_y(wander_range,randomizer);
			dir = round(point_direction(x,y,targetx,targety));
			}
			
			//regular wandering code
			var dx = cos(degtorad(dir))*(motion_speed);
			var dy =-sin(degtorad(dir))*(motion_speed);
			x+=dx;
			y+=dy;
			
			
			}
			
	} break;
	
	case enemy_states.approach: {
		
		if distance_to_object(oPlayer) < 5 motion_speed = 0.7 else motion_speed = 1.2;
		
		if distance_to_object(oPlayer) > -5 {
			//move_towards_point(oPlayer.x,oPlayer.y,motion_speed); //enable hovering inside this
			dir = point_direction(x,y,oPlayer.x+lengthdir_x(10,dir),oPlayer.y+lengthdir_y(3,dir));
			var dx = cos(degtorad(dir))*(motion_speed);
			var dy =-sin(degtorad(dir))*(motion_speed);
			x+=dx;
			y+=dy;
		}
		
		//revert to idle state
		if instance_exists(oPlayer) {
			if distance_to_object(oPlayer) >= sight_range {
				current_state = enemy_states.idle;
			}
		} 
		
	} break;
}

