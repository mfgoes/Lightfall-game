// Here we update the "player" with the torch. DEMO only and can be removed.

if instance_exists(oPlayer) {
	x = oPlayer.x;
	y = oPlayer.y; 
}

var ang = point_direction(x, y, mouse_x, mouse_y);
var dif = angle_difference(ang, image_angle);
image_angle  =ang;  //+= median(-5, dif, 5);

// Note! Changing the image_angle of the instance changes how the light is drawn too!
// You can also set the image xscale or yscale to get different effects, but to make 
// it visible the light needs to be updated afterwards or not be static. The scaled 
// sprite cannot be larger than the radius used to initialise it.

var cam = oCamera.cam; //make sure to use this to ensure proper camera follow. 
var _vw = camera_get_view_width(cam);
var _vh = camera_get_view_height(cam);
camera_set_view_pos(cam, floor(clamp(x - (_vw / 2), 0, room_width - _vw)), floor(clamp(y - (_vh / 2), 0, room_width - _vh)));