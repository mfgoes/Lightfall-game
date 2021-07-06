// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ParticlesPortal(){ //rename this to a specific part type (ie ParticlesPortal
	#region Particle Types
	//gm live 
	if (live_call()) return live_result; 
	
	//Basic particle
	var _p = part_type_create();
	var col_cyan = make_color_rgb(94,233,233);
	
	part_type_shape(_p, pt_shape_square);
	part_type_life(_p, 90, 220);
	part_type_blend(_p,true);
	part_type_alpha2(_p, 0.3, 0); 
	part_type_color2(_p, col_cyan, c_white);
	part_type_size(_p, 0.03, 0.12,-0.0003,0.001);
	part_type_speed(_p, 0.25, 1, 0, 0);
	part_type_direction(_p,85,95,0,0);
	global.ptBasic = _p;  
	
	#endregion
}