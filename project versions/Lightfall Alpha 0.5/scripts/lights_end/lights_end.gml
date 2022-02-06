// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lights_end(){
if (event_type == ev_draw) and (event_number == 0 ) {
     
    surface_reset_target();
	gpu_set_blendmode(bm_normal);

	surface_set_target(application_surface);
		 gpu_set_blendmode_ext(bm_dest_color, bm_zero);
		 draw_surface(iLight.light_surface, 0, 0);	 
		 gpu_set_blendmode(bm_normal);
	surface_reset_target();

   
}
}




//surface_set_target(application_surface);
   
//        camera_apply(camera_create_view(0,0, view_wport[view_current], view_hport[view_current]));
   
//        gpu_set_blendmode_ext(bm_dest_color, bm_zero);
//        draw_surface(iLight.light_surface, 0, 0);
//        gpu_set_blendmode(bm_normal);
       