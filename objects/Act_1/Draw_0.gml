/// @description 
draw_set_font(fnt_determination);
draw_set_valign(fa_center);
draw_set_halign(fa_center);
draw_text(obj_stats.x + 50, obj_stats.y - 55, string(HP) + "/200");
draw_set_halign(fa_left);
if (status == "Battle")
{
	if (state == "Action Select")
	{
		draw_set_valign(fa_top);
		draw_text(140, 390, Display);
	}
	else if (state == "Enemy Select")
	{
		for(var i = 0; i < array_length_1d(enemies); i++)
		{
			draw_set_font(enemies[i].font);
			if (enemies[i].Spare)
			{
				draw_text_color(200, 405 + 25*i, "* " + enemies[i].name, c_yellow, c_yellow, c_yellow, c_yellow, 1);
			}
			else
			{
				draw_text(200, 405 + 25*i, "* " + enemies[i].name);
			}
		}
	}
	else if (state == "Act Menu")
	{
		for (var i = 0; i < array_length_1d(enemies[selection[0] - 1].commands); i++)
		{
			if (i%2 == 0)
			{
				draw_text(200, 405 + 40*floor(i/2), "* " + enemies[selection[0] - 1].commands[i]);
			}
			else
			{
				draw_text(360, 405 + 40*floor(i/2), "* " + enemies[selection[0] - 1].commands[i]);
			}
		}
	}
	else if (state == "Item Menu")
	{
		for (var i = 0; i < array_length_1d(Items); i++)
		{
			if (i%2 == 0)
			{
				draw_text(200, 405 + 40*floor(i/2), "* " + Items[i]);
			}
			else
			{
				draw_text(360, 405 + 40*floor(i/2), "* " + Items[i]);
			}
		}
	}
	else if (state == "Attacking" or state == "Damage")
	{
		draw_sprite_ext(spr_Indicator, 0, 237.5, 430, 2, 2, 0, c_white, 1);
		if (Aim > -50)
		{
			draw_sprite_ext(spr_target, floor(timer/3), 237.5 + Aim, 430, 2, 2, 0, c_white, 1);
		}
	}
	else if (state == "Box Dialog" or state == "Reset Dialog" or state == "You won!")
	{
		if (obj_textbox.Dialog != "")
		{
			draw_set_valign(fa_top);
			draw_text(140, 390, obj_textbox.Display);
		}
		else if (Gaster.Dialog != "")
		{
			draw_set_font(fnt_wingdings);
			draw_text_color(Gaster.x + 50 + irandom_range(-1,1), Gaster.y - 30 + irandom_range(-1,1), Gaster.Dialog, c_gray, c_gray, c_gray, c_gray, 1);
			draw_set_font(fnt_determination);
			draw_text_color(Gaster.x + 50 + irandom_range(-1,1), Gaster.y - 30 + irandom_range(-1,1), Gaster.Dialog, c_black, c_black, c_black, c_black, 1);
		}
	}
	else if (state == "Enemy Dialogue")
	{
		for (var i = 0; i < array_length_1d(enemies); i++)
		{
			draw_set_halign(fa_right);
			draw_set_font(enemies[i].font);
			if (i == 0)
			{
				if (enemies[i].TempDialog != "")
				{
					draw_text_color(enemies[i].x - 30 + irandom_range(-1,1), enemies[i].y - 70 + irandom_range(-1,1), enemies[i].TempDialog, c_black, c_black, c_black, c_black, 1);
				}
				else
				{
					draw_text_color(enemies[i].x - 30 + irandom_range(-1,1), enemies[i].y - 70 + irandom_range(-1,1), enemies[i].Dialog, c_black, c_black, c_black, c_black, 1);
				}
			}
			else
			{
				if (enemies[i].TempDialog != "")
				{
					draw_text_color(enemies[i].x - 30 + irandom_range(-1,1), enemies[i].y - 40 + irandom_range(-1,1), enemies[i].TempDialog, c_black, c_black, c_black, c_black, 1);
				}
				else
				{
					draw_text_color(enemies[i].x - 30 + irandom_range(-1,1), enemies[i].y - 40 + irandom_range(-1,1), enemies[i].Dialog, c_black, c_black, c_black, c_black, 1);
				}
			}
		}
	}
	if (damage[0] >= 0)
	{
		damage[0]++;
		var text = "";
		if (damage[3])
		{
			text = "999";
		}
		else if (Aim > 210 or Aim < -50)
		{
			text = "MISS";
		}
		else if (Aim >= 0)
		{
			text = string(ceil(70 - Aim/3));
		}
		else
		{
			text = string(ceil(70 + Aim/50*70));
		}
		var pos = [200 - 200*sin(degtorad(90/30*min(damage[0], 30))), -10*cos(degtorad(90/10*(max(min(damage[0], 30), 20) - 20))) - 40/30*(max(min(damage[0], 120), 90) - 90), 2 - sin(degtorad(90/30*min(damage[0], 30))), 1 - 1*cos(degtorad(90/30*min(damage[0], 30)))];
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fnt_determination);
		draw_text_transformed_color(damage[1] - 40 + pos[0], damage[2] - 40 + pos[1], text, pos[2], pos[3], 0, c_black, c_black, c_black, c_black, 1 - 1/30*(max(min(damage[0], 120), 90) - 90));
		if (damage[0] >= 120)
		{
			damage[0] = -1;
		}
	}
}