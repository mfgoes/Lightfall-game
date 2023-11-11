function trackGameTime(){
	if (room != rMenu && !instance_exists(oMenuParent)) {
        global.frames_played +=1; // +=16.67; //MS per frame
	}
	
	var frames_per_second = room_speed;
	var frames_played = global.frames_played;
	
	// Calculate time components
	var minutes = floor(frames_played / (frames_per_second * 60));
	var seconds = floor((frames_played / frames_per_second) % 60);
	var centiseconds = floor((frames_played % frames_per_second) * 100 / frames_per_second);
		
	// Ensure centiseconds are displayed with one decimal place
	var centiseconds_string = string("0" + string(centiseconds));
	centiseconds_string = string_copy(centiseconds_string, string_length(centiseconds_string) - 1, 3);
		
	// Ensure seconds have at leat 1 decimal place
	var seconds_string = string("0" + string(seconds));
	seconds_string = string_copy(seconds_string, string_length(seconds_string) - 1, 3);

	// Display time and FPS
	var time_string = string(minutes) + ":" + string(seconds_string) + "." + centiseconds_string;	
	global.time_played = time_string;
}

