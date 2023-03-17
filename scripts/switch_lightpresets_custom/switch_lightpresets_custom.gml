// Script assets have changed for v2.3.0 see
/// Desc: this script switches through the presets I made for different levels. 
/// It interacts with oPlayerLightBulb , oParallaxBgr, and obj Aura Control. 
/// Try to only toggle on-click to prevent performance issues. 
function switch_light_presets_custom(){
	with(obj_Aura_Control) 
	switch(modeID) {
		case 1: {
			modename = "night mode"
			ambient_alpha = 0.2;
			col = make_color_rgb(208,199,182);
			oParallaxBgr.bgr_sky = bgr_dark_stars;
			oParallaxBgr.bgr_parallax2 = bgr_hills;
		
		}
		break;
		case 2: {
			modename = "sunset mode"
			ambient_alpha = 0.9;
			col = make_color_rgb(224,163,157);
			oParallaxBgr.bgr_sky = bgr_dark_stars;
			oParallaxBgr.bgr_parallax2 = bgr_hills;
		}
		break;
		case 3: {
			modename = "daytime mode"
			ambient_alpha = 1;
			col = c_white;
			oParallaxBgr.bgr_sky = bgr_forest;
			oParallaxBgr.bgr_parallax2 = forest_bgr2;
		}
		break; 
		case 4: {
			modename = "muddy gears"	
			ambient_alpha = 1;
			col = make_color_rgb(185,177,155); 
			oParallaxBgr.bgr_sky = bgr_gears;
			oParallaxBgr.bgr_parallax2 = par_gears; 
		}
		break;
	}
}