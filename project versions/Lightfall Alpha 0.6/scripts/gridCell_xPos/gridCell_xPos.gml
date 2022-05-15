///@function gridCell_xPos(x,cellSize)
///@argument x
///@argument cellSize
function gridCell_xPos(argument0, argument1) {

	//Initialize Variables
	var _x,_cellSize, _return;
	_x = argument0;
	_cellSize = argument1;

	//Snap x coordinate to grid.
	_return = (_x div _cellSize) * _cellSize+(_cellSize/2);

	//Return adjusted x coordinate.
	return _return;


}
