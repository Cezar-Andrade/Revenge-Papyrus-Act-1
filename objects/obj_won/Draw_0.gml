/// @description 
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_transformed(320, 240, "YOU WON!\n\nPress Z to repeat.", 2, 2, 0);
if (keyboard_check_pressed(ord("Z")))
{
	room_goto(Test);
}