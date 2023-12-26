// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_patrol() {
    // GMLive Code for Automatic Reloading
    if (live_call()) return live_result;
	
	var isOutsidePatrolArea = return_to_patrol_area();
	 // Skip the rest of the patrol logic if outside patrol area
    if (isOutsidePatrolArea) {
        return;
    }
 

    // Handle collision detection
    handle_collision_detection();

    // Control speed
    control_speed();

    // Move in the patrol direction
    move_patrol();

    // Check if player is within sight range
    check_player_detection();
}

function handle_collision_detection() {
    // Constants
    var max_spd = walk_spd;
    var buffer_zone = 10;

    // Check for wall within buffer_zone distance in the patrol direction
    var wall_detected = false;
    for (var i = 1; i <= buffer_zone; i++) {
        if (place_meeting(x + patrol_dir * i, y, oWallParent)) {
            wall_detected = true;
            break;
        }
    }

    // Check for ledge and make decision about changing direction
    var ledge_reachable = place_meeting(x + patrol_dir * TILE_SIZE, y + TILE_SIZE, oWallParent);

    // Decide to change direction if a wall is close ahead or the ledge is not reachable
    if (wall_detected || !ledge_reachable) {
    change_direction();
	}
}
function control_speed() {
    // GMLive Code for Automatic Reloading
    if (live_call()) return live_result;
    
    // Constants
	walk_spd = 2;
    var decelerate_dist = TILE_SIZE*1.5; // Distance to start decelerating
    var max_spd = walk_spd;
    var lerp_rate = 0.3; // Rate of interpolation

    // Check for wall or end of wander range within decelerate distance
    var decelerate = false;
    for (var i = 1; i <= decelerate_dist; i++) {
        if (place_meeting(x + patrol_dir * i, y, oWallParent) || 
            (x <= xstart - wander_range + decelerate_dist && patrol_dir == -1) ||
            (x >= xstart + wander_range - decelerate_dist && patrol_dir == 1)) {
            decelerate = true;
            break;
        }
    }

    // Determine target speed based on whether deceleration is needed
    var target_spd = decelerate ? walk_spd/3 : max_spd;

    // Use lerp to smoothly adjust current speed towards the target speed
    current_spd = lerp(current_spd, target_spd, lerp_rate);

    // Ensure that the speed does not exceed max speed or drop below 0
    current_spd = clamp(current_spd, walk_spd/3, max_spd);
}


function move_patrol() {
    x += patrol_dir * current_spd;
    if (patrol_dir != 0) image_xscale = -patrol_dir;
}

function return_to_patrol_area() {
    // Check if outside patrol range
    if (x < xstart - wander_range || x > xstart + wander_range) {
        // Determine the target position within the patrol range
        var targetX = clamp(x, xstart - wander_range, xstart + wander_range);

        // Calculate the direction towards the target position
        var direction_to_target = sign(targetX - x);

        // Update patrol_dir based on the direction to the target
        patrol_dir = direction_to_target;

        // Move towards the target position using walk_spd
        if !place_meeting(x+4*patrol_dir,y,oWallParent) 
			x += patrol_dir * walk_spd;
		else {
			 current_state = enemy_states.approach; 
		}

        // Update image_xscale for sprite orientation
        if (patrol_dir != 0) {
            image_xscale = -patrol_dir;
        }

        // Return true if still outside patrol area, false otherwise
        return (x < xstart - wander_range || x > xstart + wander_range);
    }
    return false;
}


function change_direction() {
    patrol_dir *= -1; // Reverse direction
    current_spd = 0; // Reset speed for direction change
}

function check_player_detection() {
    if (point_distance(x, y, target.x, target.y) < sight_range) && current_state != enemy_states.approach {
        alerted = 1; // Set alerted to 1
        create_alert_indicator(); // Create an image indicator
        current_state = enemy_states.approach; // Switch to approach state
    }
}

function create_alert_indicator() {
    var dd = instance_create_depth(x, y - (bbox_bottom - bbox_top) - 5, depth - 5, oAlertEnemy);
    dd.owner = id; 
}
