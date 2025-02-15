/// @description 
timer++;
if (state == "Enemy Attacking")
{
	if (Act_1.timer <= 560)
	{
		if (behavor == 0)
		{
			if (timer == 1)
			{
				audio_play_sound(snd_spawn, 1, false);
				Go = -radtodeg(arctan2(inst_soul.y - y, inst_soul.x - x));
			}
			else if (timer <= 31)
			{
				image_angle = Go - 90 + 360*sin(degtorad(90/30*(timer - 1)));
				image_alpha = 1/30*(timer - 1);
			}
			else if (timer == 32)
			{
				direction = image_angle + 90;
				speed = 2;
			}
			else
			{
				if (x < Act_1.Arena.x - 150 or x > Act_1.Arena.x + 150 or y < Act_1.Arena.y - 150 or y > Act_1.Arena.y + 150)
				{
					image_alpha -= 0.05;
					if (image_alpha <= 0)
					{
						instance_destroy();
					}
				}
			}
		}
		else if (behavor == 1)
		{
			if (timer == 44)
			{
				audio_play_sound(snd_pierce, 1, false);
			}
			else if (timer >= 45 and timer <= 53)
			{
				image_index = (timer - 45);
			}
			else if (timer >= 83 and timer <= 91)
			{
				image_index = (91 - timer);
			}
			else if (timer > 91)
			{
				instance_destroy();
			}
		}
	}
	else
	{
		image_alpha -= 0.05;
		if (image_alpha <= 0)
		{
			instance_destroy();
		}
	}
}
else if (behavor > -1)
{
	instance_destroy();
}