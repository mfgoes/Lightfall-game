/// @description adjust wind direction over time
timer_init("hold_pos");

if timer_get("hold_pos") <= 0 {

if grass_dir = 1 {
if grass_global_dir < 10 grass_global_dir +=0.2; else {
	grass_dir =-1; 
	timer_set("hold_pos",30); //freeze for a bit
	}
}
else if grass_dir = -1 {
	if grass_global_dir >= 0 grass_global_dir -=0.2; else {
		grass_dir =1; 
		timer_set("hold_pos",30); //freeze for a bit
	}
}
}


//test for switching between level themes
if (global.debugmode) {
	if (keyboard_check_pressed(vk_up)) {
    // Increment the current theme and wrap around to the first theme if needed
        CurrentTheme = (CurrentTheme + 1) mod array_length(themeNames);
		dd = instance_create_depth(oPlayer.x,oPlayer.y-40,0,oToastUI); 
		dd.str = CurrentTheme;
		with(oAutoTile32) init_autotile(); 
			
    } else if (keyboard_check_pressed(vk_down)) {
        // Decrement the current theme and wrap around to the last theme if needed
        CurrentTheme = (CurrentTheme - 1 + array_length(themeNames)) mod array_length(themeNames);
		dd = instance_create_depth(oPlayer.x,oPlayer.y-40,0,oToastUI); 
		dd.str = CurrentTheme;
		with(oAutoTile32) init_autotile(); 
		
	}
	ThemeSwitcher(); 
	
	}
