package;

import flixel.FlxG;
import flixel.text.FlxText;

class MustUpdateState extends MainState
{
	var text:FlxText;

	override public function create():Void
	{
		super.create();

		text = new FlxText(183, 72, 268, "Survival Rush", 32);
		text.height = 44;
		text.scrollFactor.set();
		text.alignment = CENTER;
		add(text);

		var text:FlxText = new FlxText(0, 0, 0,
			"HEY YOU\nThe Game was OutDate Now!\nPlease Update for new feature!\n\nPress ENTER to go github page download\nPress ESC to continue playing", 16);
		text.screenCenter();
		text.alignment = CENTER;
		text.scrollFactor.set();
		add(text);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.openURL("https://github.com/khuonghoanghuy/Survival-Rush/releases");
		}

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MainMenuState());
		}
	}
}
