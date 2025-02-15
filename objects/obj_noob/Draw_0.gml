/// @description 
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_transformed(320, 240, "lol You lost\n\nPress Z to try again.", 2, 2, 0);
if (keyboard_check_pressed(ord("Z")))
{
	room_goto(Test);
}