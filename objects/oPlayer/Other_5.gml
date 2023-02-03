/// @description save HP and stats to global
//CREATE NEW SAVE
var file;
file = file_text_open_write(SAVEFILE);
file_text_write_real(file,room);
global.player1_health = oPlayer.hp;
global.player1_mana = oPlayer.mana;
file_text_write_real(file,global.player1_health);
file_text_write_real(file,global.player1_mana);
file_text_close(file);
