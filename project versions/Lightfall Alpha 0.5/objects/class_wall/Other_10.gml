/// @description auto tile

//The next two variables are also initialized in the create event.
//I get an error if I dont put them here.
//I have not yet found a fix for this, so don't touch!

//Meta Variable, do not change!
myId = id;
//Size of object/sprite in pixels.
objSize = 32;

//Initialize Variables for forloop. Do not change!
var _dir = 0;
var _i, _ii, _inst;

//Check for an adjacent wall in the four cardinal directions and store the ID in an array. Do not change!
//If there is an adjacent wall, that wall will also check for adjacent walls, 
//unless variable secondCheck is true.
for(_i = 0;_i < 4;_i++)
{
	dirArray[_i] = checkFor_object_xy(x+lengthdir_x(objSize,_dir),y+lengthdir_y(objSize,_dir),class_wall);
	_inst = dirArray[_i];
	
	if secondCheck == false
	{
		if _inst
		{
			with(_inst)
			{
				secondCheck = true;
				event_user(0);
			}
		}
	}
	_dir += 90;
}

//Change Sprite-Frame based on Adjacent Walls.
image_index = calculate_object_sprite(myId,dirArray);

//Reset all IDs stored in the Array to 0
for(_ii = 0;_ii <4;_ii++)
{
	dirArray[_ii] = 0;
}

//Reset secondCheck
secondCheck = false;
