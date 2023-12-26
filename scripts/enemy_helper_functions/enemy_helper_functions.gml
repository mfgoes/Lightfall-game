// Dec 2023 update
// to do: reuse this for all enemies later
function enemy_gravity_and_freeze() {
	//pausing
	if global.game_paused {
		exit;
	}

	//gravity
	VerticalCollision(); 
	grounded = (place_meeting(x,y+1,oWallParent) or place_meeting(x,y+1,oPlatformParent));
	if y > room_height
		hp = 0;

	//flinching
	if freeze > 0 {
			freeze--;	
	}
	if flinch_anim > 0 {
		effect_flinch_anim();	
	}
	
	//timer for attacks
	atk_delay_timer--;
}


//throws rock objects every X seconds
function scr_enemy_throw_rocks() {
    if (live_call()) return live_result; 
    
    if global.game_paused exit;    
    if target != id { // if target exists
    
        timer_init("throw_rock");
    
        if timer_get("throw_rock") <= 0 {
            timer_set("throw_rock", choose(80, 100, 150));     
        }
    
        if timer_get("throw_rock") == 1 {
            // Calculate horizontal and vertical distances
            var dist_x = target.x - x;
            var dist_y = y - target.y; // Inverted to match GameMaker's coordinate system

            var ang_to_target = point_direction(x, y, target.x, target.y);
            // Check if the target is significantly higher
            if (ang_to_target > 50 && ang_to_target < 130) {
                // Throw directly at the target
                ang_to_target = point_direction(x, y, target.x, target.y);
            } else {
                // Adjust angle based on horizontal distance
                var base_angle = 20; // Minimum angle 
                var angle_increment_per_pixel = 0.1; // Increase angle based on distance
                var additional_angle = min(abs(dist_x) * angle_increment_per_pixel, 140);
                
                // Determine the direction of throw based on the horizontal distance
                if (dist_x < 0) {  // Target is to the left
                    ang_to_target = 180 - (base_angle + additional_angle);
                } else {  // Target is to the right
                    ang_to_target = base_angle + additional_angle;
                }
            }
			// Clamp the angle to ensure it's upwards and within reasonable bounds (if shooting up)
            if (ang_to_target > 0 && ang_to_target < 180)
				ang_to_target = clamp(ang_to_target, 10, 170);

            // Create rock projectile with adjusted angle
            var dd = instance_create_depth(x, y-20, depth, oRockProjectileGrav);
            dd.dir = ang_to_target + random_range(-10,10);
            dd.spd = 6;
            dd.damage = 0; // inherit damage from monster
        }   
    }
}


function state_to_string(state) {
    switch(state) {
        case enemy_states.idle: return "idle";
        case enemy_states.patrol: return "patrol";
        case enemy_states.approach: return "approach";
        case enemy_states.attack: return "attack";
        default: return "unknown";
    }
}

function scr_revert_to_patrol() {
    timer_init("forget_player_location");
	
    // Check if player is in sight without obstruction and within sight range
    var sight_obstructed = collision_line(x, y, target.x, target.y, oWallParent, true, true) != noone;
    var player_distance = point_distance(x, y, target.x, target.y);
    var player_in_sight = player_distance <= sight_range && !sight_obstructed;

    // If player is out of sight or too far, start or continue the timer
    if (player_distance > sight_range) && timer_get("forget_player_location") <= 0 {
        timer_set("forget_player_location", room_speed*6);
    }
 
    // If timer ends, revert to patrol state
    if (timer_get("forget_player_location") = 1) { // &&
        current_state = enemy_states.patrol;
        timer_set("forget_player_location", -1); // Reset timer
    }
}

