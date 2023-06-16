/// @description check if can open

if instance_exists(oWaveSystem) {
	if ds_list_size(oWaveSystem.waves)<oWaveSystem.current_wave && !instance_exists(oEnemyParent){ 
		if other.locked = true {
			var _x = oCamera.x; var _y = oCamera.y; 
			dd = instance_create_depth(_x,_y-40,0,oToastUI); 
			dd.str = "Level complete!" 
			dd.toast_type = variant.h2; 
		}
		other.image_index = 1;
		other.locked = false; 
		}
} else
locked = false; //else always leave open


if instance_exists(oPlayer) {
	if(live_call()) return live_result;

	
	// Handle player interaction with portals/doors
	with (oPlayer) {
	    var portalTimer = "portal_open_timer";

	    // Check if the portal is set to auto-open and player is colliding with an unlocked portal
	    if (place_meeting(x, y, oPortalTrigger) && !oPortalTrigger.locked && oPortalTrigger.auto_open) {
	        SlideTransition(TRANS_MODE.GOTO, other.goto_room); // Go to the next level
	    }

	    // Check if the player is colliding with an unlocked portal and holding down the E key
	    if (place_meeting(x, y, oPortalTrigger) && !oPortalTrigger.locked && keyboard_check(ord("E"))) {
	        // Start or continue the timer
	        if (timer_get(portalTimer) == -1) {
	            timer_set(portalTimer, other.open_timer); // Set the timer duration
	        } else {
	            timer_init(portalTimer);
	        }
        
	        // Check if the timer has reached 0
	        if (timer_end(portalTimer)) {
				oPlayer.hp = hp_max; //restore all HP . to do: make it animate
	            SlideTransition(TRANS_MODE.GOTO, other.goto_room); // Go to the next level
	        }
	    } else {
	        // Reset the timer if E key is released or conditions are not met
	        timer_set(portalTimer, -1);
	    }
	}



	//show arrow
	if distance_to_object(oPlayer) < 40
	{
		nearby = true;
	} else {
		nearby = false; 
	}
	
	//hover effect
	//direction+=0.03;
	//hover += cos(direction)/5;	
}


if keyboard_check(ord("E")) && (nearby) {
			timer_counter +=1; 
}
else {
	timer_counter = 0;
}
if timer_counter > open_timer timer_counter = open_timer; 
