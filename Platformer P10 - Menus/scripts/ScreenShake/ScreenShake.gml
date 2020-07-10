/// @desc ScreenShake(magnitude, frames)
/// @arg magnitude sets the strength of the shake (radius) 
/// @arg frames sets the length of the shake in frames (60 = 1 second) 

with (oCamera)
{
	if (argument0) > shake_remain
	{
		shake_magnitude = argument0;
		shake_remain = argument0;
		shake_length = argument1;
	}
}