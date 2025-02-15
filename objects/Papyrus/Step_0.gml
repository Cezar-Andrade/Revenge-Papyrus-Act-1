 /// @description 
if (status == "Overworld")
{
	if (image_speed == 0)
	{
		image_index += 1;
	}
	if (keyboard_check(vk_down) and !keyboard_check(vk_up))
	{
		sprite_index = Paps_Down;
		image_speed = 1;
		y += 3;
	}
	else if (keyboard_check(vk_up) and !keyboard_check(vk_down))
	{
		sprite_index = Paps_Up;
		image_speed = 1;
		y -= 3;
	} 
	if (keyboard_check(vk_left) and !keyboard_check(vk_right))
	{
		sprite_index = Paps_Left;
		image_speed = 1;
		x -= 3;
	}
	else if (keyboard_check(vk_right) and !keyboard_check(vk_left))
	{
		sprite_index = Paps_Right;
		image_speed = 1;
		x += 3;
	}
	if (!keyboard_check(vk_right) and !keyboard_check(vk_left) and !keyboard_check(vk_up) and !keyboard_check(vk_down))
	{
		image_index = 1;
		image_speed = 0;
	}
}
else if (status == "Entering Battle")
{
	image_index = 1;
	image_speed = 0;
}
else if (status == "Start Battle")
{
	sprite_index = Paps_Intro;
	image_speed = 1;
	if (image_index == 6)
	{
		image_speed = 0;
	}
}
else if (status == "Battle")
{
	if ((state == "Enemy Attacking" and Invulnerability > 45) or HP <= 1)
	{
		sprite_index = Paps_Dead;
		image_speed = 0;
	}
	else if (state != "Attacking" and state != "Damage")
	{
		sprite_index = Paps_Battle;
		image_speed = 1;
	}
	else if (sprite_index == Paps_Intro and image_index == 6)
	{
		image_speed = 0;
	}
}
depth = -y;