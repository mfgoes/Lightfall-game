var width = string_width(text);
var height = string_height(text);
sprite_set_bbox(sprite, xx, yy, xx + width, yy + height);

mask_index = sprite;