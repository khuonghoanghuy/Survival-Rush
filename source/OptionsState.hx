package;

import flixel.FlxG;
import flixel.text.FlxText;

class OptionsState extends MainState
{
	var text:FlxText;

	override public function create()
	{
		super.create();

		text = new FlxText(183, 72, 268, "Options", 32);
		text.height = 44;
		text.scrollFactor.set();
		text.alignment = CENTER;
		add(text);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MainMenuState());
		}
	}
}
