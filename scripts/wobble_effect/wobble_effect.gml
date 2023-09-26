/// @description Apply a wobble effect to the object when it collides with the player.
/// @func wobble_effect()
function wobble_effect() {
// Check if the object is in the camera view
if (CheckInCamera()) {
    // Check if the object is colliding with the player
    if (place_meeting(x,y,oPlayer)) {
        // If not already wobbling, start the wobble effect
        if (!wobble_triggered) {
            wobble_triggered = true;
            xDist = (x - oPlayer.x);
            var flattenAmount = .2;
            xVar = xDist*0.3;
            yVar = xDist * flattenAmount;
            wobble_direction = sign(xDist);  // Capture the initial direction
        }
    } else {
        // Reset wobble if player is not touching
        wobble_triggered = false;  
    }
}

// Gradually reduce wobble effect if it has been triggered
if (wobble_triggered) {
    xVar = xVar * .8;
    yVar = yVar * .8;
    
    // Reset the effect if it's almost done
    if (abs(xVar) < 0.05 && abs(yVar) < 0.05) {
        xVar = 0;
        yVar = 0;
    }
}
}
