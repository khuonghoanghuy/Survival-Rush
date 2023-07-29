package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class WarmSubState extends FlxSubState
{
	public function new(str:String = "")
	{
		super();

		var bg:FlxSprite = new FlxSprite();
		bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		bg.alpha = 0.6;
		bg.screenCenter();
		bg.scrollFactor.set();
		add(bg);

		var text:FlxText = new FlxText(0, 0, 0, str, 16);
		text.screenCenter();
		text.alignment = CENTER;
		text.scrollFactor.set();
		text.color = FlxColor.BLACK;
		add(text);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ANY)
		{
			close();
		}
	}
}
