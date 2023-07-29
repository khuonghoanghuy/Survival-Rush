package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class OptionsState extends MainState
{
	var text:FlxText;
	// button list
	var harderMode:FlxButton;

	override public function create()
	{
		super.create();

		text = new FlxText(183, 72, 268, "Options", 32);
		text.height = 44;
		text.scrollFactor.set();
		text.alignment = CENTER;
		add(text);

		harderMode = new FlxButton(0, 0, "HARDER MODE", harderModeChangeSave);
		harderMode.scrollFactor.set();
		add(harderMode);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MainMenuState());
		}
	}

	function harderModeChangeSave()
	{
		FlxG.save.data.harderMode = !FlxG.save.data.harderMode;
	}
}
