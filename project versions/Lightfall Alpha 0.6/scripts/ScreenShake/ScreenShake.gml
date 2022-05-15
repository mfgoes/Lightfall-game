/// @desc ScreenShake(magnitude, frames)
/// @arg magnitude sets the strength of the shake (radius) 
/// @arg frames sets the length of the shake in frames (60 = 1 second) 
function ScreenShake(argument0, argument1) {

	with (oCamera)
	{
		if (argument0) > shake_remain
		{
			shake_magnitude = argument0+zoom*1.2;
			shake_remain = argument0+zoom;
			shake_length = argument1;
		}
	}


}
