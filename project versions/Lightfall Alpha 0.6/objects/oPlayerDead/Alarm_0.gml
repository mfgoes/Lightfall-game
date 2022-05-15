/// @description Reset gamespeed + Room
game_set_speed(60,gamespeed_fps);
//old = SlideTransition(TRANS_MODE.GOTO,room);
SlideTransition(TRANS_MODE.RESTART);