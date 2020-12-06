/// @description Draw Score

//	put in script: DRAW PLAYER GUI*****

if (room != rMenu) && (instance_exists(oPlayer))
{
	//draw crosshair
	cursor_sprite = sCrosshairs;
	
	//draw cooldowns for player	
	var cooldown_posx = 800
	var cooldown_posy =  500
	draw_set_alpha(0.8);
	draw_sprite(sCooldowns_Archer,0,cooldown_posx,cooldown_posy);
	draw_sprite(sCooldowns_Archer,1,cooldown_posx+40,cooldown_posy);
	draw_sprite(sCooldowns_Archer,2,cooldown_posx+80,cooldown_posy);
	draw_text(cooldown_posx+80,cooldown_posy,oPlayer.roll_cooldown); 
	draw_text(cooldown_posx+40,cooldown_posy,oPlayer.gun_cooldown); 
	
	//draw HP	
	var hp = oPlayer.hp; var hp_max = oPlayer.hp_max;
	var healthUI = hp * 50;
	var healthUImax = hp_max * 50;
	draw_set_color(make_colour_rgb(23, 23, 43)); //hp bgr
	draw_rectangle(24,cooldown_posy,72+healthUImax,cooldown_posy+20,0);

	draw_set_color(make_colour_rgb(166, 252, 219)); //hp fgr
	draw_rectangle(24,cooldown_posy,70+healthUI,cooldown_posy+20,0);

	draw_set_color(c_white);
	DrawSetText(c_white,fUI,fa_left, fa_top);
	draw_text(24,y+55,"zoom: " + string(oCamera.zoom));
	draw_text(84,cooldown_posy+25,"shake_magnitude: " + string(oCamera.shake_magnitude));
	draw_text(8,25,"Lightfall Demo ");
	DrawSetText(c_white,fUI,fa_right, fa_top);
	draw_text_transformed(RES_W-8,RES_H-20," Press 'P' to switch character",killtextscale,killtextscale,0);
	draw_set_alpha(1);
		
		
	//only display if you've had kills
	if  (global.kills > 0) {
		killtextscale = max(killtextscale * 0.85, 1); 	
		DrawSetText(c_black,fUI,fa_right, fa_top);
		draw_text_transformed(RES_W-8,12,string(global.kills) + " Pointless Murders",killtextscale,killtextscale,0);
		draw_set_color(c_white);
		draw_text_transformed(RES_W-10,10,string(global.kills) + " Pointless Murders",killtextscale,killtextscale,0);
	}
}