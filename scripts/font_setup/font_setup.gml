// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function font_setup() {
	global.RES_TEXT = 1;
	self.font = font_add("Inter-Regular.ttf", 24,false,false,32,127);
	font_enable_sdf(self.font,true); 
	
	
draw_set_font(fSign);
if os_browser != browser_not_a_browser {
	font_enable_sdf(self.font,false); 	
	self.font = fSign;
}

}
