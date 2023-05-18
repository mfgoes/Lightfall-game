// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function font_setup() {
	global.RES_TEXT = 0.25; 
	global.pause_bg = noone;
	//self.font_smooth = font_add("Inter-Regular.ttf", 20,false,false,32,127);
	//font_enable_sdf(self.font_smooth,true); 
	
	self.font_poster = font_add("BebasNeue-Regular.ttf", 20,false,false,32,127);
	font_enable_sdf(self.font_poster,true); 
	self.font_pixel = f_title_sans; 
	
if os_browser != browser_not_a_browser {
	font_enable_sdf(self.font,false); 	
	self.font = fSign;
}

}
