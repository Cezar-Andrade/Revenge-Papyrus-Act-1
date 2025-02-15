/// @description 
depth = -y;
if (image_index == 18 and image_speed == 1)
{
	image_index = 0;
}
if (Fuck_Off >= 0)
{
	Fuck_Off++;
	x += 4;
	image_alpha = 1/20*(20 - Fuck_Off);
	if (Fuck_Off >= 20)
	{
		instance_destroy();
	}
}
if (dodge >= 0)
{
	dodge++;
	image_xscale = 2*cos(degtorad(360/30*dodge));
	if (dodge >= 30)
	{
		dodge = -1;
	}
}
if (hurt >= 0)
{
	hurt++;
	image_speed = 0;
	image_index = 18;
	x = GoTo[0] + irandom_range(-4/30*(30 - hurt), 4/30*(30 - hurt));
	y = GoTo[1] + irandom_range(-4/30*(30 - hurt), 4/30*(30 - hurt));
	if (hurt >= 30)
	{
		if (hp > 0)
		{
			image_speed = 1;
		}
		else
		{
			audio_play_sound(snd_hell_no, 1, false);
			run = 0;
		}
		hurt = -1;
	}
}
if (run >= 0)
{
	run++;
	if (run >= 30)
	{
		repeat(5)
		{
			var effect = instance_create_depth(x, y, depth + 1, obj_fade);
			effect.image_xscale = 2;
			effect.image_yscale = 2;
			effect.sprite_index = sprite_index;
			effect.image_index = image_index;
			effect.image_speed = 0;
			x += 5;
		}
		if (x >= 670)
		{
			instance_destroy();
		}
	}
}
if (Dig >= 0)
{
	Dig++;
	if (Dig == 1)
	{
		var index = 0;
		if (image_index <= 6 or image_index >= 15)
		{
			index = 4;
		}
		else if (image_index >= 7 and image_index <= 14)
		{
			index = 5;
		}
		sprite_index = spr_BoneSlam
		image_speed = 0;
		image_index = index;
	}
	else if (Dig%3 == 1 and image_index > 0)
	{
		image_index--;
	}
	else if (image_index <= 0)
	{
		visible = false;
		if (Act_1.timer >= 560)
		{
			Out = 0;
			Dig = -1;
		}
	}
}
if (Out >= 0)
{
	Out++;
	visible = true;
	if (Out%3 == 0 and image_index < 4)
	{
		image_index++;
	}
	else if (image_index >= 4)
	{
		sprite_index = spr_Bone;
		image_speed = 1;
		Out = -1;
	}
}