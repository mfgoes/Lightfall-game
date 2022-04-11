/// @description activate zones
timer_init("enter_room_timer");
//var m = 100; //half of cam width (test this later)
var middle_x = (bbox_left + bbox_right) / 2; 

#region new bounding box for camera
if instance_exists(oPlayer) {
	if collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oPlayer,0,0) {
		active = true; //variable for debugging	
		
		oCamera.x1 = bbox_left;
		oCamera.x2 = bbox_right;
		oCamera.y1 = bbox_top;
		oCamera.y2 = bbox_bottom;
		
		//fix movement for x time
		if timer_get("enter_room_timer") <= 0 && enter_room = false && flagged = false {
			timer_set("enter_room_timer",25); 
			enter_room = true;
			flagged = true;
		}
	}
	else {
		active = false; //for cameras
		flagged = false;
	}	


	#region move player when entering room
		if enter_room = true {
			with(oPlayer)  {
				can_move = false;
				//move player
				hsp = 2 * sign(middle_x - x);
			}
		}

	#endregion

	if timer_get("enter_room_timer") = 1 {
	enter_room = false; 	
	oPlayer.hsp = 0; 
	oPlayer.can_move = true;
	}
}
#endregion
