/// @desc zone generates enemies
// You can write your code in this editor
active = false;
col = c_yellow;
enter_room = false; //turn on briefly when entering new room. This disables walking and forces player to move.
flagged = false; //flagged means player has already been here


//var xpos = (bbox_right-bbox_left)/2;
//var ypos = (bbox_bottom-bbox_top)/2;
//localtarget = instance_create_depth(x+xpos,y+ypos,depth,oCamZoneFocal);	
//with(localtarget) {
//	var m = TILE_SIZE; //margin
//	x1 = zone.bbox_left+m;
//	x2 = zone.bbox_right-m;
//	y1 = zone.bbox_top+m;
//	y2 = zone.bbox_bottom-m;	
//}
