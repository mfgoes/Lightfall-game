///@function gridCell_yPos(y,cellSize)
///@argument y
///@argument cellSize
function gridCell_yPos(argument0, argument1) {

	//Initialize Variables
	var _y,_cellSize, _return;
	_y = argument0;
	_cellSize = argument1;

	//Snap y coordinate to grid.
	_return = (_y div _cellSize) * _cellSize+(_cellSize/2);

	//Return adjusted y coordinate.
	return _return;
}
