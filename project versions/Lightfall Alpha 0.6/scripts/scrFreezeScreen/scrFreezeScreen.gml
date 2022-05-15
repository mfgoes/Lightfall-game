// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrFreezeScreen(){
	var _freezedur = argument0;
	var _t = current_time + _freezedur; 

	while (current_time < _t) {};
}