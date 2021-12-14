/// @description redestroy the creation objects 
//(so they can be made again)
if instance_exists(oLevelGenerator)
	with (oLevelGenerator) instance_destroy(); 
	
if instance_exists(oUIElements)
	with (oUIElements) instance_destroy(); 
	
if instance_exists(oCamera)
	with (oCamera) instance_destroy(); 
	
if instance_exists(oTransition)
	with (oTransition) instance_destroy(); 
	