/// @description Wall Create/Destroy

//Check for Input
mouseLeft = mouse_check_button_pressed(mb_left);

//Cursor Position
x = mouse_x;
y = mouse_y;

with(myChecker)
{
	//Initialize Variables, do not change.
	var _x = controller_cursor.x;
	var _y = controller_cursor.y;

	//Adjust position of cell_checker, snap to grid.
	x = gridCell_xPos(_x,other.cellSize);
	y = gridCell_yPos(_y,other.cellSize);

	//Check for wall at x,y, of cell_checker.
	var _wall = instance_place(x,y,oWallParent);

	//On mouse click. If no wall is at x,y of cell_checker, create one. Else, destroy it.
	if other.mouseLeft
	{
		if _wall
		{
				instance_destroy(_wall);
		}
		else
		{
			instance_create_layer(x,y,"Instances",other.wallObj);
		}
	}
}