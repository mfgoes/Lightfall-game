/// @description switch between color modes

if (live_call()) return live_result; 

if (global.debugmode) {
	if keyboard_check_released(vk_left)
	{
		if modeID > 1 {
		modeID--;
		}
		else
		modeID = 4; 
	}

	if keyboard_check_released(vk_right)
	{
		if modeID < 4 {
		modeID++; 
		}
		else 
		modeID = 1; 
	}
	
	//move this to script from oGame. 
	
	switch_light_presets_custom(); 

	///	The SETTER functions in this script are:
	///	
	///		aura_set_colour(colour)
	///		aura_set_alpha(alpha)
	///		aura_set_soft(soft)
	///		aura_set_aa(aa_level)
	///		aura_set_view(view)
	///		aura_set_blendtype(blendtype)
	///		SET based on presets

	if keyboard_check_released(vk_anykey) {
		aura_set_alpha(ambient_alpha); //lerp this
		aura_set_colour(col); 
	}
}


