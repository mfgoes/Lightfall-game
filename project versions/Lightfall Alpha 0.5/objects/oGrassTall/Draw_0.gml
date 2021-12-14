/// @description Insert description here
if (CheckInCamera()) {
if distance_to_object(oPlayer) < 600 //improve this later to fit camera zoom* ~Oct 2021
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