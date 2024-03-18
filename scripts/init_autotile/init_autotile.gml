// Tiling and decoration focused
function init_autotile() {
	if (live_call()) return live_result;
	//mask_index = sprite_index;
    var neighbor_below = instance_place(x, y + 32, object_index);
    var neighbor_above = collision_point(x+1,y-32,object_index,0,0);
    var neighbor_left = instance_place(x - 32, y, object_index);
    var neighbor_right = instance_place(x + 32, y, object_index);

	var neighbor_topright = collision_point(x+32,y-32,object_index,0,0);
	var neighbor_topleft =collision_point(x-1,y-32,object_index,0,0);

    if (!neighbor_below && !neighbor_above && !neighbor_left && !neighbor_right) {
        image_index = 0; // No walls touching
    }
	else if (!neighbor_below && !neighbor_above && !neighbor_left && neighbor_right) {
        image_index = 1; // Only right wall touching
    }
    else if (!neighbor_below && !neighbor_above && neighbor_left && !neighbor_right) {
        image_index = 2; // Only left wall touching
    }
    else if (!neighbor_below && neighbor_above && !neighbor_left && !neighbor_right) {
        image_index = 3; // Only top wall touching
    }
    else if (!neighbor_below && !neighbor_above && neighbor_left && neighbor_right) {
        image_index = 4; // Left and right walls touching
    }
    else if (!neighbor_below && neighbor_above && neighbor_left && !neighbor_right) {
        image_index = 5; // Top and left walls touching
    }
	else if (!neighbor_below && neighbor_above && !neighbor_left && neighbor_right) {
        image_index = 6; // Top and right walls touching
    }
    else if (!neighbor_below && neighbor_above && neighbor_left && neighbor_right) {
        image_index = 7; // Top, left, and right walls touching
    }
    else if (neighbor_below && !neighbor_above && !neighbor_left && !neighbor_right) {
        image_index = 8; // Only bottom wall touching
    }
    else if (neighbor_below && !neighbor_above && !neighbor_left && neighbor_right) {
        image_index = 9; // Bottom and right walls touching
    }
    else if (neighbor_below && !neighbor_above && neighbor_left && !neighbor_right) {
        image_index = 10; // Bottom and left walls touching
    }
    else if (neighbor_below && !neighbor_above && neighbor_left && neighbor_right) {
        image_index = 11; // Bottom, left, and right walls touching
    }
    else if (neighbor_below && neighbor_above && !neighbor_left && !neighbor_right) {
        image_index = 12; // Bottom and top walls touching
    }
    else if (neighbor_below && neighbor_above && !neighbor_left && neighbor_right) {
        image_index = 13; // Bottom, top, and right walls touching
    }
    else if (neighbor_below && neighbor_above && neighbor_left && !neighbor_right) {
        image_index = 14; // Bottom, top, and left walls touching
    }
    else if (neighbor_below && neighbor_above && neighbor_left && neighbor_right) {
        image_index = 15; // All walls touching
    }
	
	//diagonal checks
	if sprite_index != spr_tile_template {
	
		if (!neighbor_above && neighbor_topright) or (!neighbor_above && neighbor_topleft) {
	        image_index = 16; 
	    } else exit; 
	}
}
	

function ThemeSwitcher() {
	
	var currentThemeName = oLevelGenerator.themeNames[CurrentTheme];
	
	switch(currentThemeName) {
		 case "placeholder":
           with (oAutoTile32) {
				sprite_index = spr_tile_template;   
				init_autotile()
		   }
			if instance_exists(obj_Aura_Control) {
				obj_Aura_Control.modeID = 3; //cave light
			}
            break;
        case "sand":
            // Apply the sand theme here
			 with (oAutoTile32) {
				sprite_index = tile_sand_red_32; 
				init_autotile()
			}
			if instance_exists(obj_Aura_Control) {
				obj_Aura_Control.modeID = 3; //somewhat light 
			}
		   break;
        case "darkforest":
            // Apply the darkforest theme here
			with (oAutoTile32) {
				sprite_index = tile_forest_red_32;   
				init_autotile()
			}
			if instance_exists(obj_Aura_Control) {
				obj_Aura_Control.modeID = 1; //dark
			}
            break;
		case "darkforest5AM": //slightly lighter color
            // Apply the darkforest theme here
			with (oAutoTile32) {
				sprite_index = tile_forest_red_32;   
				init_autotile()
			}
			if instance_exists(obj_Aura_Control) {
				obj_Aura_Control.modeID = 5; // a bit dark
			}
            break;
			
        case "snow":
            // Apply the snow theme here
			with (oAutoTile32) {
				sprite_index = tile_snow_red_32;   
				init_autotile()
		   }
			if instance_exists(obj_Aura_Control) {
				obj_Aura_Control.modeID = 4; //very light 
			}
			break;
		case "morningforest":
            // Apply the sand theme here
			 with (oAutoTile32) {
				sprite_index = tile_forest_red_32; 
				init_autotile()
			}
			if instance_exists(obj_Aura_Control) {
				obj_Aura_Control.modeID = 3; //very light 
			}
		   break;
	}
}


function initializeLevelGenerator() {
	global.partSystem = part_system_create();
	part_system_depth(global.partSystem, -100);

	if !(global.HTML_config) {	//no fog on html version
		if !instance_exists(oParticleFog) { //make global setting for particles later
			instance_create_depth(0,0,depth,oParticleFog);
		} else instance_destroy(); 
	}

	if !instance_exists(oParticleSnow) {
		instance_create_depth(0,0,depth,oParticleSnow);
	} else instance_destroy(); 

	//draw parallax
	if !instance_exists(oParallaxBgr) && layer_exists("parallax_bgr") {
		instance_create_layer(0,0,"parallax_bgr",oParallaxBgr);
	}


	//Wind effect
	grass_global_dir = 0;
	grass_dir = 1; //right, then left
}
	
	
///@desc draws the backgrounds of the levels
function draw_background_theme() {
	
	//if (live_call()) return live_result; 
	
	//enable theme switching
	 with(oLevelGenerator) {
		other.currentThemeName = themeNames[CurrentTheme];
	}
	
	#region essential variables
		//to do: remove magic numbers once I figure out how it works. 
		var bgr_sky = bgr_testing;	//furthest in the back
		var bg_hills = -1;		//second furthest
		var bg_hillsfront = -1;	//third furthest	 	
		
		var view_cam = view_camera[0]; 
		var r_num = sprite_get_height(bg_hills)*5; //this might change something??
		var vx1 = camera_get_view_x(oCamera.cam) + (camera_get_view_width(view_cam)/display_get_width());
		
		var vx = camera_get_view_x(oCamera.cam) + ((r_num*camera_get_view_width(view_cam)*1.333)/display_get_width());
		var vx2 =  camera_get_view_x(oCamera.cam) + ((1900*camera_get_view_width(view_cam)*1.333)/display_get_width()); //(r_num*camera_get_view_width(view_cam)/display_get_width());
		
		var vy = camera_get_view_y(oCamera.cam) - (140*camera_get_view_height(view_cam)/display_get_height()); 
		var vy2 = camera_get_view_y(oCamera.cam) + (400*camera_get_view_height(view_cam)/display_get_height());

		//scale based on zoom level (has bugs)
		var res = 6;
		var xscale = res*(camera_get_view_width(view_camera[0])/display_get_width());
		var yscale =  res*(camera_get_view_height(view_camera[0])/display_get_height());
		var xshiftcam = xscale*oCamera.x * 0.1;
	#endregion

	switch(currentThemeName) {
	    case "sand": {
			var bgr_sky = bgr_sunnydessert;	//furthest in the back
			var bg_hills = bgr_hills;		//second furthest
			var bg_hillsfront = bgr_hills;	//third furthest	 	 	
		}
	        break;
	    case "darkforest": {
			var bgr_sky = bgr_dark_stars;	//furthest in the back
			var bg_hills = bgr_hills;		//second furthest
			var bg_hillsfront = bgr_hills;	//third furthest	 	 	
		}
	        break;
	    case "snow": {
			var bgr_sky = bgr_snow;	//furthest in the back
			var bg_hills = bgr_hills;		//second furthest
			var bg_hillsfront = bgr_hills;	//third furthest	 	 	
		}
	        break;
		case "morningforest": {
			var bgr_sky = bgr_forest;	//furthest in the back
			var bg_hills = bgr_hills;		//second furthest
			var bg_hillsfront = bgr_hills;	//third furthest	 	 	
		}
	        break;
		case "darkforest5AM": {
			var bgr_sky = bgr_dark_stars;	//furthest in the back
			var bg_hills = bgr_hills;		//second furthest
			var bg_hillsfront = bgr_hills;	//third furthest	 	 	
		}
	        break;
		default: {
			var bgr_sky = bgr_testing;	//furthest in the back
			var bg_hills = -1;		//second furthest
			var bg_hillsfront = -1;	//third furthest	 	 
		}
	}
	draw_sprite_ext(bgr_sky,0, vx1,vy,xscale,yscale,0,c_white,1); 
	if bg_hills != -1 {
		draw_sprite_ext(bg_hills,0, vx  - xshiftcam,vy2,xscale,yscale,0,c_white,1); //left side
		draw_sprite_ext(bg_hills,0, vx2 - xshiftcam,vy2,xscale,yscale,0,c_white,1); //right side
		
	}
}