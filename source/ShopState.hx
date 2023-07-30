package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.ui.FlxButtonPlus;
import flixel.text.FlxText;

class ShopState extends FlxState
{
	var coinText:FlxText;
	var text:FlxText;

	// button
	var armor:FlxButtonPlus;
	var weapon:FlxButtonPlus;
	var moreHealth:FlxButtonPlus;

	override public function create():Void
	{
		super.create();

		FlxG.save.bind("shopSystem", "survivalRush");

		text = new FlxText(18, 57, 268, "Options", 32);
		text.height = 44;
		text.scrollFactor.set();
		text.alignment = CENTER;
		add(text);

		coinText = new FlxText(5, FlxG.height - 22, 0, "COIN: " + FlxG.save.data.coin, 16);
		coinText.scrollFactor.set();
		coinText.alignment = LEFT;
		add(coinText);

		addButton();
	}

	function addButton()
	{
		armor = new FlxButtonPlus(100, 200, getArmor, "BUY ARMOR");
		armor.scrollFactor.set();
		add(armor);

		weapon = new FlxButtonPlus(100, 200, getWeapon, "BUY WEAPON");
		weapon.scrollFactor.set();
		add(weapon);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		coinText.text = "COIN: " + FlxG.save.data.coin;

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MainMenuState());
		}
	}

	function getArmor()
	{
		if (FlxG.save.data.coin >= 500)
			FlxG.save.data.armor = true;
		else
			trace("NOT FULL COIN TO BUY");
	}

	function getWeapon()
	{
		if (FlxG.save.data.coin >= 500)
			FlxG.save.data.weapon = true;
		else
			trace("NOT FULL COIN TO BUY");
	}
}
