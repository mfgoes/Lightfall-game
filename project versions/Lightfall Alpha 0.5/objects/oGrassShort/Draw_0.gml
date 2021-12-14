/// @description Insert description here
if (CheckInCamera()) {
if distance_to_object(oPlayer) < 600
draw_sprite_pos(sprite_index, image_index,
   bbox_left + xVar,
   bbox_top + yVar, //flatten a bit
   bbox_right + xVar,
   bbox_top + yVar,
   bbox_right,
   bbox_bottom + 1,
   bbox_left,
   bbox_bottom + 1,
   1)  
}