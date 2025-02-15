function scr_Item_1(argument0) {
	if (argument0 == "Spaghetti")
	{
		obj_textbox.Dialog = "* Papyrus eats his Spaghetti\n  it doesn't have flavor\n  because he doesn't have a\n  tongue.";
		HP += 40;
		HP = min(HP, 200);
	}
	else if (argument0 == "Ketchup")
	{
		obj_textbox.Dialog = "* Papyrus drinks the Ketchup\n  his brother loved this\n  bottle of ketchup...";
		HP = 200;
	}
	for (var i = selection[1] - 1; i < array_length_1d(Items); i++)
	{
		if (i + 1 < array_length_1d(Items))
		{
			Items[i] = Items[i + 1];
		}
	}
	var aux = [];
	for (var i = 0; i < array_length_1d(Items) - 1; i++)
	{
		aux[i] = Items[i];
	}
	Items = aux;


}
