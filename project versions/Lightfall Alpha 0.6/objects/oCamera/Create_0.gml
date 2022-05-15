/// @description Set up Camera
//GMLive
//if (live_call()) return live_result; 

//clipping area for zones
x1 = 0;
x2 = 0;
y1 = 0;
y2 = 0;
active_zone = false; //turn on when in zone
lerp_q = 0.1; //increase this till it becomes 1 (no more interpolation) 
//test lerping
x_new = 0; y_new = 0; //reset this to follow position (ie oPlayer)
