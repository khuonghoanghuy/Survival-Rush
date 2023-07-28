package;

import flixel.FlxG;
import flixel.FlxState;

class MainState extends FlxState
{
	override public function create():Void
	{
		super.create();

		FlxG.save.bind("dataGame", "survivalRush");
		#if debug
		flixel.addons.studio.FlxStudio.create();
		#end
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
