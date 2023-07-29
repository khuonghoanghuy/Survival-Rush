package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

/**
	A SubState display text
**/
class WarmSubState extends FlxSubState
{
	var wasWin:Bool = false;

	public function new(str:String = "", ifWin:Bool)
	{
		super();

		wasWin = ifWin;

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
			if (wasWin)
			{
				close();
				FlxG.switchState(new MainMenuState());
			}
			else
			{
				close();
			}
		}
	}
}
