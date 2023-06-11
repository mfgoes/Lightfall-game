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
		
		var _x = 12; //margin left
		var _x2 = RES_W-12; 
		var _y = 50; //margin top 1
		var _y2 = RES_H - 60; 
		var lh = 10; //line_Height; 
				
		//lighting stuff
		if instance_exists(obj_Aura_Control) {
			draw_set_halign(fa_left);
			draw_text(_x,_y,"Lighting: " + string(obj_Aura_Control.modename) + " - +"); 
			//draw_text(_x,_y + lh*2,"Aura col: " + string(obj_Aura_Control.col)); 
			//draw_text(_x,_y + lh*3,"Aura alpha: " + string(obj_Aura_Control.ambient_alpha)); 
		}
		
		//fps check and editor
		draw_set_halign(fa_right);
		draw_text(_x2,_y2+lh,"Rfps: " + string(fps_reader));
		draw_text(_x2,_y2+lh*2,"Gfps: " + string(fps) + "\n P to change");
		
		//draw_text(4,60,"camW: " + string(camera_get_view_width(oCamera.cam)));
		//draw_text(4,50,"camH: " + string(camera_get_view_height(oCamera.cam)));
		//draw_text(4,40,"zoom: " + string(oCamera.zoom));
		//dd = (place_meeting(oPlayer.x,oPlayer.y + 1,oPlatformParent)) 
		//draw_text(4,70,"aura cam: " + string(obj_Aura_Control.aura_view));
		//draw_text(4,80,"zoom cam: " + string(oCamera.cam));	
	}	

}
	