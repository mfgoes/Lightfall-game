/// @description Insert description here
// You can write your code in this editor
active = false;
col = c_yellow;
enter_room = false; //turn on briefly when entering new room. This disables walking and forces player to move.
flagged = false; //flagged means player has already been here
fade = 0; //transparency of darkness

#region create gradients on edges
	g1 = instance_create_depth(bbox_left+30,y,depth,oGradientLevel32); g1.image_xscale = -1;
	g2 = instance_create_depth(bbox_right-30,y,depth,oGradientLevel32);
#endregion
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
