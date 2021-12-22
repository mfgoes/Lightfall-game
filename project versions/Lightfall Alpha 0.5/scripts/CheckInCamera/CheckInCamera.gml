// Easily improve performance with this script. 
//Dec 15 2021
function CheckInCamera(){
	var cam = view_camera[0];
	var x1 = camera_get_view_x(cam);
	var y1 = camera_get_view_y(cam);
	var x2 = x1 + camera_get_view_width(cam);
	var y2 = y1 + camera_get_view_height(cam);
	if( !point_in_rectangle( x, y, x1, y1, x2, y2)) {
		return false;
	}
	else return true;
	//if distance_to_object(oPlayer) < 150 return false; else return true; 
}