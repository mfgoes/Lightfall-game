///@function checkFor_object_xy(x,y,obj)
///@argument x
///@argument y
///@argument obj
function checkFor_object_xy(argument0, argument1, argument2) {

	//Initialize variables
	var _x,_y,_obj
	_x = argument0;
	_y = argument1;
	_obj = argument2;


	//Check for object at x,y position, if true return instance id
	var _checkTarget = instance_place(argument0,argument1,argument2);
	if (_checkTarget)
		{
			return _checkTarget;
		}
		else
		{
			return false;
		}


}
