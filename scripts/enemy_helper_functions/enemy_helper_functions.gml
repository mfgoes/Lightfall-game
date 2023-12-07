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
	if global.game_paused exit;	
	if target != id { //if target exists
	
		timer_init("throw_rock");
	
		if timer_get("throw_rock") <= 0 {
			timer_set("throw_rock",choose(80,100,150)); 	
		}
	
		if timer_get("throw_rock") = 1 {
			var ang_adjust = -50 * sign(image_xscale); //adjust angle depending on player position
			dd = instance_create_depth(x,y,depth,oRockProjectileGrav);	
			dd.dir = point_direction(x,y,target.x,target.y) + ang_adjust;
			dd.spd = 8;
		}	
	}
}

/// scr_enemy_patrol()
function scr_enemy_patrol() {
    // Define a buffer zone to prevent rapid direction changes
    var buffer_zone = 5; // Adjust this value as needed

    // Check if at the edges of the patrol range, including buffer zone
    if ((x <= xstart - wander_range + buffer_zone && patrol_dir == -1) ||
        (x >= xstart + wander_range - buffer_zone && patrol_dir == 1)) {
        patrol_dir *= -1; // Reverse direction
    }

    // Move in the patrol direction
    x += patrol_dir * walk_spd; // Assume walk_spd is defined elsewhere

    // Adjust image_xscale based on patrol direction for facing direction
    if (patrol_dir != 0) image_xscale = -patrol_dir;

    // Check if player is within sight range
    if (point_distance(x, y, target.x, target.y) < sight_range) {
        alerted = 1; // Set alerted to 1
		dd = instance_create_depth(x,y-(bbox_bottom - bbox_top)-5,depth-5,oAlertEnemy); //create an image indicator
		dd.owner = id; 
        current_state = enemy_states.approach; // Switch to approach state
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

/// scr_revert_to_patrol()
function scr_revert_to_patrol() {
    var timer_name = "player_sight";
    // Debug information
    var debug_msg = "";
	
    // Check if player is in sight without obstruction and within sight range
    var sight_obstructed = collision_line(x, y, target.x, target.y, oWallParent, true, true) != noone;
    var player_distance = point_distance(x, y, target.x, target.y);
    var player_in_sight = player_distance <= sight_range && !sight_obstructed;

    // If player is out of sight or too far, start or continue the timer
    if (!player_in_sight || player_distance > sight_range) {
        if (timer_get(timer_name) == -1) {
            timer_set(timer_name, 160); // Set timer for around 3 seconds
        }
    } else {
        timer_set(timer_name, -1); // Reset timer if player is in sight and within range
    }

    // If timer ends, revert to patrol state
    if (timer_end(timer_name)) {
        current_state = enemy_states.patrol;
        timer_set(timer_name, -1); // Reset timer
		debug_msg += "Reverting to patrol\n";
    }
}

