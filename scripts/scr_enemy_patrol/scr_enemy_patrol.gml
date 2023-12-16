// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_patrol() {
    // GMLive Code for Automatic Reloading
    if (live_call()) return live_result;

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
    if (wall_detected || !ledge_reachable || 
        (x <= xstart - wander_range + buffer_zone && patrol_dir == -1) ||
        (x >= xstart + wander_range - buffer_zone && patrol_dir == 1)) {
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

function change_direction() {
    patrol_dir *= -1; // Reverse direction
    current_spd = 0; // Reset speed for direction change
}

function check_player_detection() {
    if (point_distance(x, y, target.x, target.y) < sight_range) {
        alerted = 1; // Set alerted to 1
        create_alert_indicator(); // Create an image indicator
        current_state = enemy_states.approach; // Switch to approach state
    }
}

function create_alert_indicator() {
    var dd = instance_create_depth(x, y - (bbox_bottom - bbox_top) - 5, depth - 5, oAlertEnemy);
    dd.owner = id; 
}
