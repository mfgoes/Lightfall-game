/// @description switch between color modes

//if (live_call()) return live_result; 

//switch between lighting modes
switch(modeID) {
	case 1: {
		modename = "night mode"
		ambient_alpha_new = 0.4;
		col = make_color_rgb(208,199,182);
	}
	break;
	case 2: {
		modename = "sunset mode"
		ambient_alpha_new = 0.9;
		//col = make_color_rgb(224,163,157);
		col = make_color_rgb(244,215,212);
	}
	break;
	case 3: {
		modename = "daytime mode"
		ambient_alpha_new = 0.94;
		col = c_white;
	}
	break; 
	case 4: {
		modename = "pretty dark"	
		ambient_alpha_new = 1;
		col = c_white; //make_color_rgb(239,239,246);
	}
	break;
}

//update colors (check if it's not equal to the previous modenID first
//aura_set_alpha(ambient_alpha); //lerp this
//aura_set_colour(col); 

//Toggle between lighting
//UPDATE 30 JUL: The switch is now handles in the theme switcher instead of here.
var key_toggle = vk_up or vk_down;
if (global.debugmode) {
	ambient_alpha = lerp(ambient_alpha,ambient_alpha_new,0.03);
	aura_set_alpha(ambient_alpha); //lerp this

	if keyboard_check_released(key_toggle) {
		aura_set_alpha(ambient_alpha); //lerp this
		aura_set_colour(col); 	
	}
}	

