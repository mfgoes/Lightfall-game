/// @description weapon & charge animations

//Load weapon data from player
sprite_index = oPlayer.character_weapons[0];
image_alpha = oPlayer.character_weapons[1];

//don't draw sprite when rolling
if oPlayer.state != PlayerStateRoll draw_self(); else exit;

//draw weapon animations (ie charging animation)
if weapon_charge > 0 {
gpu_set_blendmode(bm_add);
draw_line_width_color(x,y,x+lengthdir_x(5+weapon_charge*1.5,image_angle),y+lengthdir_y(5+weapon_charge*1.5,image_angle),4,c_black,c_red);
gpu_set_blendmode(bm_normal);
}
