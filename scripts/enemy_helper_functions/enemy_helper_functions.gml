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
			dd.spd = 7;
			dd.damage = damage; //inherit damage from monster
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

