/// @description progress text
letters += spd;
text_current = string_copy(text,1,floor(letters));

draw_set_font(font);
if (h==0) h = string_height(text);
w = string_width(text_current);

//Destroy when done
if (letters >= length) && (keyboard_check_pressed(vk_anykey)) or distance_to_object(oPlayer) > 120
{
	instance_destroy();
	with (oCamera) follow = oPlayer;
} 
//change camera position if player moves away
if distance_to_object(oPlayer) > 30 {
	with (oCamera) follow = oPlayer;
}
