function scr_Bone1(argument0) {
	var count = 0;
	for (var i = 0; i < array_length_1d(enemies); i++)
	{
		if (!enemies[i].Spare and enemies[i].AttackUse == "Bone1")
		{
			count++;
		}
	}
	if (argument0 == 0)
	{
		if (((Act_1.timer - 30)%90 == 0 and count >= 2) or ((Act_1.timer - 30)%60 == 0 and count <= 1))
		{
			var deg = irandom(360);
			var bullet = instance_create_depth(Arena.x + 150*cos(degtorad(deg)), Arena.y - 150*sin(degtorad(deg)), inst_soul.depth - 1, obj_bullet);
			bullet.behavor = 0;
			bullet.sprite_index = spr_BoneAttack;
			bullet.image_alpha = 0;
			bullet.image_xscale = 2;
			bullet.image_yscale = 2;
		}
	}
	else if (argument0 == 1)
	{
		if (count >= 3)
		{
			if ((Act_1.timer - 30)%90 == 30)
			{
				var deg = irandom(360);
				var bullet = instance_create_depth(Arena.x + 150*cos(degtorad(deg)), Arena.y - 150*sin(degtorad(deg)), inst_soul.depth - 1, obj_bullet);
				bullet.behavor = 0;
				bullet.sprite_index = spr_BoneAttack;
				bullet.image_alpha = 0;
				bullet.image_xscale = 2;
				bullet.image_yscale = 2;
			}
		}
		else
		{
			if ((Act_1.timer - 30)%90 == 45)
			{
				var deg = irandom(360);
				var bullet = instance_create_depth(Arena.x + 150*cos(degtorad(deg)), Arena.y - 150*sin(degtorad(deg)), inst_soul.depth - 1, obj_bullet);
				bullet.behavor = 0;
				bullet.sprite_index = spr_BoneAttack;
				bullet.image_alpha = 0;
				bullet.image_xscale = 2;
				bullet.image_yscale = 2;
			}
		}
	}
	else
	{
		if ((Act_1.timer - 30)%90 == 60)
		{
			var deg = irandom(360);
			var bullet = instance_create_depth(Arena.x + 150*cos(degtorad(deg)), Arena.y - 150*sin(degtorad(deg)), inst_soul.depth - 1, obj_bullet);
			bullet.behavor = 0;
			bullet.sprite_index = spr_BoneAttack;
			bullet.image_alpha = 0;
			bullet.image_xscale = 2;
			bullet.image_yscale = 2;
		}
	}


}
