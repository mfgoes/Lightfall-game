// Restart game
if keyboard_check_released(ord("R")) {
    SlideTransition(TRANS_MODE.RESTART);
}

// Click on selected item
if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_enter)) {
    menu_committed = menu_move;
    if (menu_committed != -1) {
        audio_ui_click();
    }
}

// Controls
if (menu_control && alarm[0] <= 0) {
    // Key controls
    if (keyboard_check_pressed(vk_down)) {
        menu_move++;
        if (menu_move >= menu_index) menu_move = 0;
    }

    if (keyboard_check_pressed(vk_up)) {
        menu_move--;
        if (menu_move < 0) menu_move = menu_index - 1;
    }

    // Mouse controls
    var mouse_y_gui = device_mouse_y_to_gui(0);    
    if (mouse_y_gui < menu_y_bot) && (mouse_y_gui > menu_y_top) {
        menu_move = (mouse_y_gui - menu_y_top) div (line_height / resolution);
    }  else {
	menu_move = -1;
	}
	
    // Confirm button
   if (keyboard_check_released(vk_enter) or (menu_committed != -1)) {
        switch (menu_committed) {
            case 0: // Continue
                instance_destroy();
                global.game_paused = false;
                display_set_gui_size(RES_W, RES_H);
                break;

            case 1: // Sound settings
                instance_destroy();
                with (oGame) pause_menu = instance_create_depth(0, 0, depth, oSettingsMenu);
                break;

            case 2: // Controls
                instance_destroy();
                with (oGame) pause_menu = instance_create_depth(0, 0, depth, oControlsMenu);
                break;

            case 3: // Credits
                instance_destroy();
                with (oGame) pause_menu = instance_create_depth(0, 0, depth, oCreditsMenu);
                break;

            case 4: // Start screen
                instance_destroy(oGame);
                instance_destroy(oCamera);
                display_set_gui_size(RES_W, RES_H);
                room_goto(rMenu);
                break;

            case 5: // Quit game (only when not in browser)
                if (os_browser == browser_not_a_browser) {
                    game_end();
                    break;
                }
        }
    }
}

// GUI items ease in
// menu_x += (menu_x_target - menu_x) / menu_speed;

// Debug room switching
if global.debugmode {
    if keyboard_check_released(vk_left) {
        room_goto_previous();
        instance_destroy();
    }
    if keyboard_check_released(vk_right) {
        room_goto_next();
        instance_destroy();
    }
}
