package;

import flixel.FlxGame;
import openfl.display.FPS;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, TitleState, 60, 60));
		addChild(new FPS(0, 0, 0xFFFFFF));
		#if debug
		flixel.addons.studio.FlxStudio.create();
		#end
	}
}
