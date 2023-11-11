/// @description Menu settings

// Inherit this stuff
// Restart game
if (keyboard_check_released(ord("R"))) {
    audio_ui_click(); 
    SlideTransition(TRANS_MODE.RESTART);
}

// Click on selected item
if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_enter)) {
    menu_committed = menu_move;
    if (menu_committed != -1) {
        audio_ui_click();
    }
}

// Keypad controls
if (keyboard_check_pressed(vk_down)) {
    menu_move++;
    if (menu_move >= menu_index) {
        menu_move = 0;
    }
}

if (keyboard_check_pressed(vk_up)) {
    menu_move--;
    if (menu_move < 0) {
        menu_move = menu_index - 1;
    }
}

var mouse_y_gui = (device_mouse_y_to_gui(0)); 

if (mouse_y_gui < menu_y_bot) && (mouse_y_gui > menu_y_top) {
    // Checks if mouse y position lines up
    menu_move = (mouse_y_gui - menu_y_top) div (line_height / resolution);    
}

// Confirm button
if (keyboard_check_released(vk_enter) || (menu_committed != -1)) {
    switch (menu_committed) {
        case 0: // Restart room
            SlideTransition(TRANS_MODE.RESTART);
            break;        
        case 1: // Back to start menu
            SlideTransition(TRANS_MODE.GOTO, rMenu);
            break;
    }
}
