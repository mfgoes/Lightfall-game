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
		var _x2 = RES_W-4; 
		var _y = -10; //margin top 1
		var _y2 = RES_H - 60; 
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
		
		//fps check and editor
		draw_set_halign(fa_right);
		draw_set_alpha(0.5); 
		draw_text(_x2,_y2+lh*3,"Rfps: " + string(fps_reader));
		draw_text(_x2,_y2+lh*4,"" + string(oGame.current_fps) + "P for slowmode");
		draw_set_alpha(1); 
		
		//draw_text(4,60,"camW: " + string(camera_get_view_width(oCamera.cam)));
		//draw_text(4,50,"camH: " + string(camera_get_view_height(oCamera.cam)));
		//draw_text(4,40,"zoom: " + string(oCamera.zoom));
		//dd = (place_meeting(oPlayer.x,oPlayer.y + 1,oPlatformParent)) 
		//draw_text(4,70,"aura cam: " + string(obj_Aura_Control.aura_view));
		//draw_text(4,80,"zoom cam: " + string(oCamera.cam));	
	}	

}
	