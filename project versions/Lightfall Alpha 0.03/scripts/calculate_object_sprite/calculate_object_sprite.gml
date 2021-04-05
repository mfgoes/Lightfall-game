///@function calculate_object_sprite(x,y,obj)
///@argument instance
///@argument directions
function calculate_object_sprite(argument0, argument1) {

	//Initialize variables
	var _inst, _directions, _0, _90, _180, _270, _sprite;
	_inst = argument0;
	_directions = argument1;

	_0 = _directions[0];
	_90 = _directions[1];
	_180 = _directions[2];
	_270 = _directions[3];

#region Calculate Wall Sprite-Frame based on adjacent Walls.

	//Single (No adjacent)
	if (_0 + _90 + _180 + _270) == 0
	{
		_sprite = 0;
	}
	//All (Adjacent on all sides)
	else if _0 != 0 and _90 != 0 and _180 != 0 and _270 != 0
	{
		_sprite = 1;
	}

	//Cardinal (Adjacent wall on one of the four cardinal directions)

	//Adjacent wall on the left.
	else if _180 != 0 and (_0 + _90 + _270) == 0
	{
		_sprite = 2;
	}
	//Adjacent wall on the bottom.
	else if _270 != 0 and (_0 + _90 + _180) == 0
	{
		_sprite = 3;
	}
	//Adjacent wall on the right.
	else if _0 != 0 and (_90 + _180 + _270) == 0
	{
		_sprite = 4;
	}
	//Adjacent wall on the top.
	else if _90 != 0 and (_0 + _180 + _270) == 0
	{
		_sprite = 5;
	}

	//Cardinal Two (Adjacent walls on horizontal or vertical directions)

	//Adjacent walls on the right and left.
	else if _0 != 0 and _180 != 0 and (_90 + _270) == 0
	{
		_sprite = 6;
	}
	//Adjacent walls on the top and bottom.
	else if _90 != 0 and _270 != 0 and (_0 + _180) == 0
	{
		_sprite = 7;
	}

	//Cardinal Three (Adjacent walls on three of the cardinal sides)

	//Adjacent wall on the top, left and bottom.
	else if _90 != 0 and _180 != 0 and _270 != 0 and _0 == 0
	{
		_sprite = 8;
	}
	//Adjacent wall on the right, left and bottom.
	else if _0 != 0 != 0 and _180 != 0 and _270 != 0 != 0 and _90 == 0 
	{
		_sprite = 9;
	}
	//Adjacent wall on the right, top and bottom.
	else if _0 != 0 and _90 != 0 and _270 != 0 and _180 == 0
	{
		_sprite = 10;
	}
	//Adjacent wall on the right, top and left.
	else if _0 != 0 and _90 != 0 and _180 != 0 and _270 == 0
	{
		_sprite = 11;
	}

	//Corners (All corner positions, have two adjacent walls)

	//Adjacent walls on the left and bottom.
	else if _180 != 0 and _270 != 0 and (_0 + _90) == 0
	{
		_sprite = 12;
	}
	//Adjacent walls on the right and bottom.
	else if _0 != 0 and _270 != 0 and (_90 + _180) == 0
	{
		_sprite = 13;
	}
	//Adjacent walls on the right and top.
	else if _0 != 0 and _90 != 0 and (_180 + _270) == 0
	{
		_sprite = 14;
	}
	//Adjacent walls on the left and top.
	else if _90 != 0 and _180 != 0 and (_0 + _270) == 0
	{
		_sprite = 15;
	}
#endregion

	//Return correct Sprite-Frame
	return _sprite;



}
