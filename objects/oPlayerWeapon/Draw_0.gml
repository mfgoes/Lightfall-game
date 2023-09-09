/// @desc weapon & charge animations
draw_weapon(); //based on current_weapon

if (global.debugmode) {
    
    // Get the closest shootable instance
    var closest = instance_nearest(x, y, pShootable);
    
    // Determine the true aim direction
    var true_aim;
    if (closest != noone) {
        true_aim = point_direction(x, y, closest.x, closest.y-12);
    } else {
        true_aim = 90;
    }
    
    // Check assistance distance based on player's facing direction
    var linecheck = cos(oPlayer.facing_direction) * assist_dist;
    
    // Check if the closest instance meets the conditions for drawing
    if (closest != noone && 
        distance_to_object(closest) < assist_dist &&
        sign(closest.x - x) == sign(cos(oPlayer.facing_direction)) && 
        abs(closest.y - y) < 100 && 
        !collision_line(x, y-12, closest.x, closest.y-12, oWallParent, 0, 0)) {
        
        // Change the line color based on angle range
        if (angle_in_range) {
            draw_set_color(c_green);
        } else {
            draw_set_color(c_red);
        }
        
        // Draw the line
        draw_line(x, y, closest.x, closest.y-10);
    }
}
