package;

import flixel.FlxG;
import flixel.addons.ui.FlxButtonPlus; // i love the plus one
import flixel.text.FlxText;

class OptionsState extends MainState
{
	var text:FlxText;
	var hintText:FlxText;
	// button list
	var fullScreenButton:FlxButtonPlus;
	var harderModeButton:FlxButtonPlus;

	override public function create()
	{
		super.create();

		text = new FlxText(183, 72, 268, "Options", 32);
		text.height = 44;
		text.scrollFactor.set();
		text.alignment = CENTER;
		add(text);

		hintText = new FlxText(10, FlxG.height - 22, 0, "PRESS ESC TO RETURN MAIN MENU", 12);
		hintText.alignment = LEFT;
		hintText.scrollFactor.set();
		add(hintText);

		addButton();
	}

	function addButton()
	{
		fullScreenButton = new FlxButtonPlus(100, 200, clickFullScreen, FlxG.fullscreen ? "FULLSCREEN" : "WINDOWED");
		fullScreenButton.scrollFactor.set();
		add(fullScreenButton);

		harderModeButton = new FlxButtonPlus(100, 250, clickHarderMode, FlxG.save.data.harderMode ? "HARDER MODE: ON" : "HARDER MODE: OFF");
		harderModeButton.scrollFactor.set();
		add(harderModeButton);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ESCAPE)
		{
			FlxG.switchState(new MainMenuState());
		}
	}

	function clickFullScreen()
	{
		FlxG.fullscreen = !FlxG.fullscreen;
		fullScreenButton.text = FlxG.fullscreen ? "FULLSCREEN" : "WINDOWED";
		FlxG.save.data.fullscreen = FlxG.fullscreen;
	}

	function clickHarderMode()
	{
		FlxG.save.data.harderMode = !FlxG.save.data.harderMode;
		harderModeButton.text = FlxG.save.data.harderMode ? "HARDER MODE: ON" : "HARDER MODE: OFF";
		FlxG.save.data.harderMode = FlxG.save.data.harderMode;
	}
}
