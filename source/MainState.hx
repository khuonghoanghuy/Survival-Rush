package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import lime.app.Application;

using StringTools;

class MainState extends FlxState
{
	var versionText:FlxText;
	var version:String;

	override public function create():Void
	{
		super.create();

		#if debug
		flixel.addons.studio.FlxStudio.create();
		#end

		version = Application.current.meta.get("version");

		versionText = new FlxText(10, 10, 0, "Version: v" + version, 12);
		versionText.scrollFactor.set();
		versionText.cameras = [FlxG.cameras.list[0]];
		add(versionText);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
