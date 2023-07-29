package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;

class MainState extends FlxState
{
	var versionText:FlxText;
	var version:String = '1.0.0';

	override public function create():Void
	{
		super.create();

		FlxG.save.bind("dataGame", "survivalRush");
		#if debug
		flixel.addons.studio.FlxStudio.create();
		#end

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
