/// @description Insert description here
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
aura_set_alpha(ambient_alpha); //lerp this
aura_set_colour(col); 