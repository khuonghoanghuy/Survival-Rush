package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import lime.app.Application;

class MainState extends FlxState
{
	var versionText:FlxText;

	override public function create():Void
	{
		super.create();

		FlxG.save.bind("dataGame", "survivalRush");
		#if debug
		flixel.addons.studio.FlxStudio.create();
		#end

		versionText = new FlxText(10, 10, 0, "Version: v" + Application.current.meta.get("version"), 12);
		versionText.scrollFactor.set();
		versionText.cameras = [FlxG.cameras.list[0]];
		add(versionText);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
