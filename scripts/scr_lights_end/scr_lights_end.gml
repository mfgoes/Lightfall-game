// Script assets have changed for v2.3.0 see
//This will turn the black into transparency, creating a 'glow' effect from the white being strong on the outside and gradually weakening further from the circle centre.

function scr_lights_end(){
if (event_type == ev_draw) and (event_number == 0 ) {
     
    surface_reset_target();
	surface_set_target(application_surface);
	gpu_set_blendmode_ext(bm_dest_color, bm_zero);
	
	 draw_surface(iLight.light_surface, 0, 0);	 
	 gpu_set_blendmode(bm_normal);
	 surface_reset_target();

   
}
}
