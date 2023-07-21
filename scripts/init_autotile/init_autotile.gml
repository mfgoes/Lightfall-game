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
            break;
        case "sand":
            // Apply the sand theme here
			 with (oAutoTile32) {
				sprite_index = tile_sand_red_32; 
				init_autotile()
		   }
            break;
        case "darkforest":
            // Apply the darkforest theme here
			 with (oAutoTile32) {
				sprite_index = tile_forest_red_32;   
				init_autotile()
		   }
            break;
        case "snow":
            // Apply the snow theme here
			 with (oAutoTile32) {
				sprite_index = tile_snow_red_32;   
				init_autotile()
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