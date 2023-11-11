// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_Debug_UI(){

}

//GMLive

		
function draw_debug_info(){
	if (live_call()) return live_result; 
	
	draw_set_font(fSign); 
	draw_set_color(c_white); 
	
	if global.debugmode = true { //&& instance_exists(oCamera)
		
		var _x = 8; //margin left
		
		var _y = -10; //margin top 1
		var lh = 10; //line_Height; 
				
		//lighting stuff
		if instance_exists(obj_Aura_Control) {
			draw_set_halign(fa_left);
			with (oLevelGenerator) var currentThemeName = oLevelGenerator.themeNames[CurrentTheme];
			draw_text(_x,_y + lh,"Theme: " + string(currentThemeName) + " - +"); 
			draw_set_alpha(0.5); 
			draw_text(_x,_y + lh*2,"Col: " + string(obj_Aura_Control.col) + ", A: " + string(obj_Aura_Control.ambient_alpha)); 
			//draw_text(_x,_y + lh*3,"Aura alpha: " + ); 
			draw_set_alpha(1);
		}

		//draw time played
		draw_text(_x,_y + lh*3,"Time: " + string(global.time_played)); 
	}	

}
	