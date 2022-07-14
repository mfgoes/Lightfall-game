/// @description Confirm button
switch (menu_index) {
		
	case 0: //new game
		show_debug_message("PRESS: NEW GAME");
		SlideTransition(TRANS_MODE.GOTO,rLevel1); 
		break;
		
	case 1: //load game
		show_debug_message("PRESS: NEW GAME");
		if (!file_exists(SAVEFILE)) {
				SlideTransition(TRANS_MODE.NEXT);	
		}
		else {
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				global.kills = file_text_read_real(file);
				global.hasgun = file_text_read_real(file);
				global.exp_points = file_text_read_real(file);
				file_text_close(file);
				SlideTransition(TRANS_MODE.GOTO,target);
		}
		break;
		
	case 2: //options
		show_debug_message("PRESS: OPTIONS");
		break;		
	case 3: //end game
		show_debug_message("PRESS: QUIT");
		break;		
}