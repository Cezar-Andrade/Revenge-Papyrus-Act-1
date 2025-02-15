/// @description 
if (status == "Battle")
{
	if (state == "Enemy Select" or state == "Act Menu" or state == "Item Menu" or state == "Enemy Attacking" or state == "Reseting")
	{
		visible = true;
	}
	else
	{
		visible = false;
	}
	if (state == "Enemy Attacking" and Act_1.timer >= 20 and Act_1.timer <= 560)
	{
		if (keyboard_check(vk_up))
		{
			y -= 2;
		}
		else if (keyboard_check(vk_down))
		{
			y += 2;
		}
		if (keyboard_check(vk_left))
		{
			x -= 2;
		}
		else if (keyboard_check(vk_right))
		{
			x += 2;
		}
		x = max(min(x, Act_1.Arena.x + 155/2 - 8), Act_1.Arena.x - 155/2 + 8);
		y = max(min(y, Act_1.Arena.y + 155/2 - 8), Act_1.Arena.y - 155/2 + 8);
		if (Invulnerability%12 <= 5 and Invulnerability > -1 and HP > 1)
		{
			visible = false;
		}
	}
}
else
{
	visible = false;
}