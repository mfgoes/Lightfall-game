/// @description ?
draw_alpha = 1;
enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO,
	TRIGGER
}
trigger_room=-1
mode = TRANS_MODE.INTRO;
w = display_get_gui_width();
h = display_get_gui_height();
h_half = h/2;

percent = 1;
percent_target = 1;
target = room;