if glow_alpha = 0.75 or glow_alpha = 0.2 { //opacity range
	glow_direction = -glow_direction;
	}
glow_alpha -= 0.002*glow_direction;
gpu_set_blendmode(bm_add);
draw_sprite_ext(sPortalGlow,0,x,y,2.2,1,0,c_white,glow_alpha);
gpu_set_blendmode(bm_normal);
draw_self();
