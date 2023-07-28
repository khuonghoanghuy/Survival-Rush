package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class TitleState extends MainState
{
	var text:FlxText;
	var pressEnter:FlxText;

	override public function create()
	{
		super.create();

		text = new FlxText(183, 72, 268, "Survival Rush", 32);
		text.height = 44;
		text.scrollFactor.set();
		text.alignment = CENTER;
		add(text);

		pressEnter = new FlxText(199, 270, 236, "Press Enter to Continue", 16);
		pressEnter.height = 24;
		pressEnter.scrollFactor.set();
		pressEnter.alignment = CENTER;
		pressEnter.color = FlxColor.WHITE;
		add(pressEnter);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.camera.flash(FlxColor.WHITE, 1, getNextState);
		}
	}

	function getNextState()
	{
		pressEnter.color = FlxColor.YELLOW;
		FlxG.switchState(new MainMenuState());
	}
}
