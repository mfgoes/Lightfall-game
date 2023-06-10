/// @description switch between color modes

if (live_call()) return live_result; 

//switch between lighting modes
switch(modeID) {
	case 1: {
		modename = "night mode"
		ambient_alpha = 0.2;
		col = make_color_rgb(208,199,182);
		
	}
	break;
	case 2: {
		modename = "sunset mode"
		ambient_alpha = 0.9;
		col = make_color_rgb(224,163,157);;
	}
	break;
	case 3: {
		modename = "daytime mode"
		ambient_alpha = 1;
		col = c_white;
	}
	break; 
	case 4: {
		modename = "shiny caves mode"	
		ambient_alpha = 0.6;
		col = make_color_rgb(107,105,191);
	}
	break;
}

//update colors (check if it's not equal to the previous modenID first
//aura_set_alpha(ambient_alpha); //lerp this
//aura_set_colour(col); 
	
if (global.debugmode) {
	if keyboard_check_released(vk_left)
	{
		if modeID > 1 {
		modeID--;
		}
		else
		modeID = 4; 
	}

	if keyboard_check_released(vk_right)
	{
		if modeID < 4 {
		modeID++; 
		}
		else 
		modeID = 1; 
	}

	///	The SETTER functions in this script are:
	///	
	///		aura_set_colour(colour)
	///		aura_set_alpha(alpha)
	///		aura_set_soft(soft)
	///		aura_set_aa(aa_level)
	///		aura_set_view(view)
	///		aura_set_blendtype(blendtype)
	///		SET based on presets

	if keyboard_check_released(vk_anykey) {
		aura_set_alpha(ambient_alpha); //lerp this
		aura_set_colour(col); 
	}
}


