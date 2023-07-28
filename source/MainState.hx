package;

import flixel.FlxG;
import flixel.FlxState;

class MainState extends FlxState
{
	override public function create():Void
	{
		super.create();

		FlxG.save.bind("dataGame", "survivalRush");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
