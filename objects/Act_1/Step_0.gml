/// @description 
if (!audio_is_playing(msc_overworld_1) and !audio_is_playing(msc_overworld_2) and HP > 1)
{
	audio_play_sound(msc_overworld_2, 2, true);
}
if (status == "Enter Battle")
{
	timer += 1;
	if (timer >= 60)
	{
		timer = 0;
		status = "Transition Battle";
	}
}
else if (status == "Transition Battle")
{
	timer += 1;
	Papyrus.x += (160 - Papyrus.x)/(21 - timer);
	Papyrus.y += (240 - Papyrus.y)/(21 - timer);
	Gaster.x += (120 - Gaster.x)/(21 - timer);
	Gaster.y += (320 - Gaster.y)/(21 - timer);
	for (var i = 0; i <= array_length_1d(enemies) - 1; i++)
	{
		enemies[i].x += (enemies[i].GoTo[0] - enemies[i].x)/(21 - timer);
		enemies[i].y += (enemies[i].GoTo[1] - enemies[i].y)/(21 - timer);
	}
	if (timer >= 20)
	{
		timer = 0;
		status = "Start Battle";
		audio_play_sound(snd_battle, 1, false);
	}
}
else if (status == "Start Battle")
{
	timer += 1;
	obj_textbox.x = 320;
	obj_textbox.y = 680 - 200*sin(degtorad(90/20*timer));
	if (timer <= array_length_1d(enemies))
	{
		if (irandom(2) == 1)
		{
			enemies[timer - 1].Dialog = "I want some\nfood right\nnow.";
		}
		else
		{
			enemies[timer - 1].Dialog = "I want to\nbe a good\nattack.";
		}
	}
	if (timer >= 20)
	{
		Gaster.timer = 0;
		status = "Battle";
		state = "Action Select"
		selection = [1, 1];
		Dialog = "* Bone shaped enemies attack!";
		Display = "";
		choice = 1;
		timer = 0;
		for (var i = 0; i <= array_length_1d(enemies) - 1; i++)
		{
			enemies[i].image_speed = 1;
		}
		if (array_length_1d(enemies) >= 2)
		{
			enemies[0].image_index = 8;
			if (array_length_1d(enemies) >= 3)
			{
				enemies[2].image_index = 8;
			}
		}
	}
}
else if (status == "Battle")
{
	if (state == "Action Select" or state == "Enemy Select" or state == "Item Menu" or state == "Act Menu")
	{
		obj_stats.Altura += (-98 - obj_stats.Altura)/4;
	}
	else
	{
		obj_stats.Altura += (-66 - obj_stats.Altura)/4;
	}
	if (state == "Action Select")
	{
		if (keyboard_check_pressed(ord("X")))
		{
			skip = true;
		}
		if (!skip)
		{
			char++;
			if (char%3 == 0)
			{
				if (Dialog != Display)
				{
					audio_play_sound(snd_textbox, 1, false);
				}
				Display = string_insert(string_char_at(Dialog, string_length(Display) + 1), Display, string_length(Display) + 1);
			}
		}
		while (skip and string_length(Display) < string_length(Dialog))
		{
			Display = string_insert(string_char_at(Dialog, string_length(Display) + 1), Display, string_length(Display) + 1);
		}
		if (keyboard_check_pressed(vk_left))
		{
			audio_play_sound(snd_selecting, 1, false);
			choice--;
		}
		if (keyboard_check_pressed(vk_right))
		{
			audio_play_sound(snd_selecting, 1, false);
			choice++;
		}
		if (choice > 5)
		{
			choice -= 5;
		}
		else if (choice < 1)
		{
			choice += 5;
		}
		if (keyboard_check_pressed(ord("Z")))
		{
			audio_play_sound(snd_confirm, 1, false);
			Display = "";
			skip = false;
			char = 0;
			if (choice <= 2 or choice == 4)
			{
				state = "Enemy Select";
			}
			else if (choice == 3)
			{
				if (array_length_1d(Items) > 0)
				{
					state = "Item Menu";
					inst_soul.x = 180;
					inst_soul.y = 405;
				}
				else
				{
					obj_textbox.Dialog = "* Papyrus doesn't have more Items.";
					state = "Reset Dialog";
				}
			}
			else if (choice == 5)
			{
				Papyrus.Def = 2;
				obj_textbox.Dialog = "* Papyrus prepares for the enemy's\nattack.\n* DEF increased temporally!";
				state = "Box Dialog";
			}
		}
	}
	else if (state == "Enemy Select")
	{
		if (keyboard_check_pressed(vk_up))
		{
			audio_play_sound(snd_selecting, 1, false);
			selection[0]--;
		}
		else if (keyboard_check_pressed(vk_down))
		{
			audio_play_sound(snd_selecting, 1, false);
			selection[0]++;
		}
		if (selection[0] > array_length_1d(enemies))
		{
			selection[0] -= array_length_1d(enemies); 
		}
		else if (selection[0] < 1)
		{
			selection[0] += array_length_1d(enemies); 
		}
		inst_soul.x = 180; 
		inst_soul.y = 380 + 25*selection[0];
		if (keyboard_check_pressed(ord("X")))
		{
			audio_play_sound(snd_selecting, 1, false);
			state = "Action Select"
			selection[0] = 1;
			inst_soul.y = 600;
		}
		else if (keyboard_check_pressed(ord("Z")))
		{
			audio_play_sound(snd_confirm, 1, false);
			if (choice == 2)
			{
				state = "Act Menu";
				inst_soul.y = 405;
			}
			else if (choice == 4)
			{
				state = "Box Dialog";
				scr_Spare(enemies[selection[0] - 1]);
				inst_soul.y = 600;
			}
			else
			{
				audio_play_sound(snd_spawn, 1, false);
				state = "Attacking";
				bone = instance_create_depth(Papyrus.x + 2, Papyrus.y - 120, -1100, obj_bullet);
				bone.image_xscale = 2;
				bone.image_yscale = 2;
				bone.image_alpha = 0;
				bone.sprite_index = spr_BoneAttack;
				Papyrus.sprite_index = Paps_Intro;
				Papyrus.image_speed = 0;
				Papyrus.image_index = 0;
				inst_soul.y = 600;
			}
		}
	}
	else if (state == "Act Menu" or state == "Item Menu")
	{
		if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_down))
		{
			audio_play_sound(snd_selecting, 1, false);
			if (inst_soul.x <= 180 and ((array_length_1d(enemies[selection[0] - 1].commands) >= 3 and state == "Act Menu") or (array_length_1d(Items) >= 3 and state == "Item Menu")))
			{
				if (inst_soul.y <= 405)
				{
					inst_soul.y = 445;
					selection[1] = 3;
				}
				else
				{
					inst_soul.y = 405;
					selection[1] = 1;
				}
			}
			else if ((array_length_1d(enemies[selection[0] - 1].commands) >= 4 and state == "Act Menu") or (array_length_1d(Items) >= 4 and state == "Item Menu"))
			{
				if (inst_soul.y <= 405)
				{
					inst_soul.y = 445;
					selection[1] = 4;
				}
				else
				{
					inst_soul.y = 405;
					selection[1] = 2;
				}
			}
		}
		else if (keyboard_check_pressed(vk_left) or keyboard_check_pressed(vk_right))
		{
			audio_play_sound(snd_selecting, 1, false);
			if (inst_soul.y <= 405 and ((array_length_1d(enemies[selection[0] - 1].commands) >= 2 and state == "Act Menu") or (array_length_1d(Items) >= 2 and state == "Item Menu")))
			{
				if (inst_soul.x <= 180)
				{
					inst_soul.x = 340;
					selection[1] = 2;
				}
				else
				{
					inst_soul.x = 180;
					selection[1] = 1;
				}
			}
			else if ((array_length_1d(enemies[selection[0] - 1].commands) >= 4 and state == "Act Menu") or (array_length_1d(Items) >= 4 and state == "Item Menu"))
			{
				if (inst_soul.x <= 180)
				{
					inst_soul.x = 340;
					selection[1] = 4;
				}
				else
				{
					inst_soul.x = 180;
					selection[1] = 3;
				}
			}
		}
		if (keyboard_check_pressed(ord("X")))
		{
			audio_play_sound(snd_selecting, 1, false);
			if (state == "Act Menu")
			{
				state = "Enemy Select";
				inst_soul.x = 180;
			}
			else
			{
				state = "Action Select";
				inst_soul.x = 180;
				inst_soul.y = 600;
			}
			selection[1] = 1;
		}
		else if (keyboard_check_pressed(ord("Z")))
		{
			audio_play_sound(snd_confirm, 1, false);
			if (state == "Act Menu")
			{
				scr_Act_1(enemies[selection[0] - 1].name, enemies[selection[0] - 1].commands[selection[1] - 1]);
			}
			else
			{
				audio_play_sound(snd_eat, 1, false);
				scr_Item_1(Items[selection[1] - 1]);
			}
			state = "Box Dialog";
		}
	}
	else if (state == "Attacking")
	{
		timer++;
		bone.image_alpha = 1/20*min(timer, 20);
		bone.image_angle = -radtodeg(arctan2((enemies[selection[0] - 1].y - 30) - bone.y, enemies[selection[0] - 1].x - bone.x)) + 90 + 360*sin(degtorad(90/20*min(timer, 20)));
		bone.diff = [enemies[selection[0] - 1].x - bone.x, (enemies[selection[0] - 1].y - 30) - bone.y];
		if (keyboard_check_pressed(ord("Z")) and Aim < 260)
		{
			audio_play_sound(snd_throw, 1, false);
			timer = 0;
			bone.speed = sqrt(power(bone.diff[0], 2) + power(bone.diff[1], 2))/20;
			bone.direction = bone.image_angle - 90;
			Papyrus.image_speed = 1;
			state = "Damage";
		}
		else
		{
			Aim -= 4;
		}
		if (Aim < -50)
		{
			audio_play_sound(snd_throw, 1, false);
			timer = 0;
			bone.speed = sqrt(power(bone.diff[0], 2) + power(bone.diff[1], 2))/20;
			bone.direction = bone.image_angle - 90;
			Papyrus.image_speed = 1;
			state = "Damage";
		}
	}
	else if (state == "Damage")
	{
		timer++;
		if (timer == 20)
		{
			damage = [0, enemies[selection[0] - 1].x, enemies[selection[0] - 1].y, false];
			if (enemies[selection[0] - 1].Spare and Aim >= -50)
			{
				audio_play_sound(snd_damage, 1, false);
				damage[3] = true;
				enemies[selection[0] - 1].hurt = 0;
				enemies[selection[0] - 1].hp = max(enemies[selection[0] - 1].hp - 999, 0);
			}
			else if (Aim > 210 or Aim < -50)
			{
				enemies[selection[0] - 1].dodge = 0;
			}
			else if (Aim >= 0)
			{
				audio_play_sound(snd_damage, 1, false);
				enemies[selection[0] - 1].hurt = 0;
				enemies[selection[0] - 1].hp = max(enemies[selection[0] - 1].hp - ceil(70 - Aim/3), 0);
			}
			else
			{
				audio_play_sound(snd_damage, 1, false);
				enemies[selection[0] - 1].hurt = 0;
				enemies[selection[0] - 1].hp = max(enemies[selection[0] - 1].hp - ceil(70 + Aim/50*70), 0);
			}
			if (enemies[selection[0] - 1].hp <= 0)
			{
				for (var i = selection[0] - 1; i < array_length_1d(enemies); i++)
				{
					if (i + 1 < array_length_1d(enemies))
					{
						enemies[i] = enemies[i + 1];
					}
				}
				var aux = [];
				for (var i = 0; i < array_length_1d(enemies) - 1; i++)
				{
					aux[i] = enemies[i];
				}
				enemies = aux;
			}
		}
		else if (timer > 60)
		{
			timer = 0;
			if (array_length_1d(enemies) > 0)
			{
				audio_play_sound(snd_enemy, 1, false);
				state = "Enemy Dialogue";
			}
			else
			{
				obj_textbox.Dialog = "* YOU WON!";
				state = "You won!";
			}
		}
	}
	else if (state == "Box Dialog" or state == "Reset Dialog" or state == "You won!")
	{
		if (obj_textbox.Dialog != "")
		{
			if (keyboard_check_pressed(ord("X")))
			{
				skip = true;
			}
			if (!skip)
			{
				char++;
				if (char%3 == 0)
				{
					if (obj_textbox.Dialog != obj_textbox.Display)
					{
						audio_play_sound(snd_textbox, 1, false);
					}
					obj_textbox.Display = string_insert(string_char_at(obj_textbox.Dialog, string_length(obj_textbox.Display) + 1), obj_textbox.Display, string_length(obj_textbox.Display) + 1);
				}
			}
			while (skip and string_length(obj_textbox.Display) < string_length(obj_textbox.Dialog))
			{
				obj_textbox.Display = string_insert(string_char_at(obj_textbox.Dialog, string_length(obj_textbox.Display) + 1), obj_textbox.Display, string_length(obj_textbox.Display) + 1);
			}
			if (keyboard_check_pressed(ord("Z")))
			{
				skip = false;
				char = 0;
				obj_textbox.Dialog = "";
				obj_textbox.Display = "";
			}
		}
		else if (state == "Reset Dialog")
		{
			state = "Action Select";
		}
		else if (state == "Box Dialog" and array_length_1d(enemies) <= 0)
		{
			obj_textbox.Dialog = "* YOU WON!";
			state = "You won!";
		}
		else if (state == "You won!")
		{
			audio_stop_all();
			room_goto(Won);
		}
		else if (Gaster.Dialog != "")
		{
			if (!Gaster.sound)
			{
				Gaster.sound = true;
				audio_play_sound(snd_gaster, 1, false);
			}
			if (keyboard_check_pressed(ord("Z")))
			{
				Gaster.sound = false;
				Gaster.Dialog = "";
			}
		}
		else
		{
			audio_play_sound(snd_enemy, 1, false);
			state = "Enemy Dialogue";
		}
	}
	else if (state == "Enemy Dialogue")
	{
		if (keyboard_check_pressed(ord("Z")))
		{
			for (var i = 0; i < array_length_1d(enemies); i ++)
			{
				enemies[i].TempDialog = "";
			}
			timer = -1;
			state = "Enemy Attacking";
		}
	}
	else if (state == "Enemy Attacking")
	{
		timer++;
		if (Invulnerability > -1)
		{
			if (Invulnerability > 45)
			{
				Papyrus.x += sin(degtorad(360/15*Invulnerability));
				Papyrus.image_index = 0;
			}
			Invulnerability--;
		}
		if (timer == 0)
		{
			for (var i = 0; i < array_length_1d(enemies); i++)
			{
				enemies[i].AttackUse = enemies[i].Attacks[irandom_range(0, array_length_1d(enemies[i].Attacks) - 1)];
				if (enemies[i].AttackUse != "")
				{
					if (enemies[i].AttackUse == "Bone2")
					{
						enemies[i].ID = timer;
						enemies[i].Dig = 0;
						timer++;
					}
				}
			}
			timer = 0;
			for (var i = 0; i < array_length_1d(enemies); i++)
			{
				if (enemies[i].AttackUse != "")
				{
					if (enemies[i].AttackUse == "Bone1")
					{
						enemies[i].ID = timer;
						timer++;
					}
				}
			}
			timer = 0;
			Arena = instance_create_layer(320, 220, "Instances", obj_arena);
			Arena.image_angle = -90;
			Arena.image_xscale = 0;
			Arena.image_yscale = 0;
			Arena.image_alpha = 0;
			var effect = instance_create_depth(Papyrus.x, Papyrus.y - 50, inst_soul.depth + 1, obj_fade);
			effect.sprite_index = spr_wave;
			effect.expand = [2/16, 2/16];
			inst_soul.x = Papyrus.x;
			inst_soul.y = Papyrus.y - 50;
		}
		else if (timer <= 20)
		{
			var effect = instance_create_depth(Arena.x, Arena.y, Arena.depth + 1, obj_fade);
			effect.sprite_index = spr_arena;
			effect.image_xscale = Arena.image_xscale;
			effect.image_yscale = Arena.image_yscale;
			effect.image_angle = Arena.image_angle;
			Arena.image_angle = -90/20*(20 - timer);
			Arena.image_xscale = 1/20*timer;
			Arena.image_yscale = 1/20*timer;
			Arena.image_alpha = 1/20*timer;
			inst_soul.x += (Arena.x - inst_soul.x)/(21 - timer);
			inst_soul.y += (Arena.y - inst_soul.y)/(21 - timer);
		}
		else if (timer >= 560)
		{
			if (HP <= 1)
			{
				timer++;
				Papyrus.image_index = 0;
			}
			Invulnerability = -1;
			var effect = instance_create_depth(Arena.x, Arena.y, Arena.depth + 1, obj_fade);
			effect.sprite_index = spr_arena;
			effect.image_xscale = Arena.image_xscale;
			effect.image_yscale = Arena.image_yscale;
			effect.image_angle = Arena.image_angle;
			Arena.image_angle = -90/20*(timer - 560);
			Arena.image_xscale = 1/20*(580 - timer);
			Arena.image_yscale = 1/20*(580 - timer);
			Arena.image_alpha = 1/20*(580 - timer);
			inst_soul.x += (Papyrus.x - inst_soul.x)/(581 - timer);
			inst_soul.y += ((Papyrus.y - 50) - inst_soul.y)/(581 - timer);
			if (timer >= 580)
			{
				var effect = instance_create_depth(Papyrus.x, Papyrus.y - 50, inst_soul.depth + 1, obj_fade);
				effect.sprite_index = spr_wave;
				effect.expand = [2/16, 2/16];
				inst_soul.x = 180;
				inst_soul.y = 600;
				instance_destroy(Arena);
				selection = [1, 1];
				choice = 1;
				for (var i = 0; i < array_length_1d(enemies); i++)
				{
					if (enemies[i].Spare)
					{
						Dialog = "* Bone enemy seems happy with\nPapyrus.";
						break;
					}
					else
					{
						Dialog = choose("* Smells like bones.", "* Bone enemy moves up and down\n  like if it was dancing.")
					}
				}
				Aim = 320;
				Papyrus.Def = 1;
				if (HP > 1)
				{
					state = "Action Select";
				}
				else
				{
					audio_stop_all();
					audio_play_sound(snd_damage, 1, false);
					timer = 0;
					state = "Game Over";
					Papyrus.image_index = 1;
				}
			}
		}
		else
		{
			var count = 0;
			for (var i = 0; i < array_length_1d(enemies); i++)
			{
				if (enemies[i].AttackUse != "")
				{
					scr_Attacks(enemies[i].name, enemies[i].AttackUse, enemies[i].ID);
				}
				else
				{
					count++;
				}
			}
			if (count == array_length_1d(enemies) and timer <= 550)
			{
				timer = 550;
			}
		}
	}
	else if (state == "Game Over")
	{
		timer++;
		Papyrus.y = 240 - 30*sin(180/20*min(timer, 20));
		if (timer <= 20)
		{
			Papyrus.x -= 2;
			Papyrus.image_index = 1;
		}
		else if (timer == 21)
		{
			Papyrus.image_index = 0;
		}
		else if (timer > 21 and timer <= 36)
		{
			Papyrus.x += sin(degtorad(360/15*(timer - 21)));
		}
		else if (timer == 90)
		{
			Papyrus.image_index = 2;
		}
		else if (timer == 120)
		{
			room_goto(Game_Over);
		}
	}
	else if (state == "You won!")
	{
		if (keyboard_check_pressed(ord("Z")))
		{
			audio_stop_all();
			room_goto("Won");
		}
	}
	if (choice == 1)
	{
		inst_fight.image_blend = c_white;
	}
	else
	{
		inst_fight.image_blend = c_gray;
	}
	if (choice == 2)
	{
		inst_gaster.image_blend = c_white;
	}
	else
	{
		inst_gaster.image_blend = c_gray;
	}
	if (choice == 3)
	{
		inst_item.image_blend = c_white;
	}
	else
	{
		inst_item.image_blend = c_gray;
	}
	if (choice == 4)
	{
		inst_mercy.image_blend = c_white;
	}
	else
	{
		inst_mercy.image_blend = c_gray;
	}
	if (choice == 5)
	{
		inst_defend.image_blend = c_white;
	}
	else
	{
		inst_defend.image_blend = c_gray;
	}
}