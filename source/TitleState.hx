package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import haxe.Http;
import lime.app.Application;

using StringTools;

class TitleState extends MainState
{
	var text:FlxText;
	var pressEnter:FlxText;
	var mustUpdate:Bool;

	var updateVersion:String = '';

	override public function create()
	{
		super.create();

		getCheck("version");
		getCheck("save");

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
			pressEnter.color = FlxColor.YELLOW;
		}
	}

	function getNextState()
	{
		if (mustUpdate)
			FlxG.switchState(new MustUpdateState());
		else
			FlxG.switchState(new MainMenuState());
	}

	function getCheck(type:String)
	{
		switch (type)
		{
			case "version":
				trace("check version");
				var http = new haxe.Http("https://raw.githubusercontent.com/khuonghoanghuy/Survival-Rush/main/gameVersion.txt");
				http.onData = function(data:String)
				{
					updateVersion = data.split('\n')[0].trim();
					var curVersion:String = version.trim();
					if (updateVersion != curVersion)
						mustUpdate = true;
				}

				http.onError = function(error)
				{
					trace('error: $error');
				}

				http.request();

			case "save":
				trace("check save");
				SaveData.init();
				FlxG.save.bind("dataGame", "survivalRush");
		}
	}
}
