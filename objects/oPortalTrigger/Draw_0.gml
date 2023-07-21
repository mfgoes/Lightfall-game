///@desc draw self + glow
var fadeDuration = 0.5; // Adjust this value as per your preference (e.g., 0.5 seconds)
image_index = 0; 

if locked = false {
	image_index = 1; 
	// Increment the glow_timer by the delta_time
	glow_timer += 0.01; //delta_time;
	var fadeFactor = (1 + sin(glow_timer / fadeDuration)) / 2;
	draw_sprite_ext(sPortalGlow, 0, x, y, 1, 1, 0, c_white, fadeFactor); 
	}
	
draw_self();
if nearby draw_sprite_ext(sMarker,0,x,y-30+hover,1,1,0,c_white,1);


