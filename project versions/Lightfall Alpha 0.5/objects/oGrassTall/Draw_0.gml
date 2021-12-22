/// @description Insert description here
if (CheckInCamera()) {
draw_sprite_pos(sprite_index, image_index,
   bbox_left + xVar,
   bbox_top + yVar + 5, //flatten a bit
   bbox_right + xVar,
   bbox_top + yVar + 5,
   bbox_right,
   bbox_bottom + 1,
   bbox_left,
   bbox_bottom + 1,
   1)
}