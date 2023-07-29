package;

import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class MainMenuState extends MainState
{
	// button list
	var buttonStart:FlxButton;
	var buttonShop:FlxButton;
	var buttonOptions:FlxButton;
	#if sys
	var buttonExit:FlxButton;
	#end
	var text:FlxText;

	var selectBoss:Int = 0;
	var selectText:FlxText;
	var selectString:String = '';

	override public function create()
	{
		super.create();

		var beingX:Int = 47;

		text = new FlxText(183, 72, 268, "Survival Rush", 32);
		text.height = 44;
		text.scrollFactor.set();
		text.alignment = CENTER;
		add(text);

		buttonStart = new FlxButton(beingX, 100, "Start", get_start);
		add(buttonStart);

		buttonShop = new FlxButton(beingX, 150, "Shop", get_shop);
		add(buttonShop);

		buttonOptions = new FlxButton(beingX, 200, "Options", get_options);
		add(buttonOptions);

		#if sys
		buttonExit = new FlxButton(beingX, 250, "Exit", get_exit);
		add(buttonExit);
		#end

		selectText = new FlxText(10, FlxG.height - 10, 10, "< " + selectString + " >", 12);
		selectText.alignment = LEFT;
		selectText.scrollFactor.set();
		add(selectText);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		selectText.text = "< " + selectString + " >";

		switch (selectBoss)
		{
			case 0:
				selectString = "GOOLY GUY";
			case 1:
				selectString = "BIG MAN";
		}

		if (FlxG.keys.justPressed.LEFT)
		{
			if (selectBoss == 0)
			{
				selectBoss = 1;
			}
			else
			{
				selectBoss--;
			}
		}

		if (FlxG.keys.justPressed.RIGHT)
		{
			if (selectBoss == 1)
			{
				selectBoss = 0;
			}
			else
			{
				selectBoss++;
			}
		}
	}

	function get_start()
	{
		FlxG.camera.flash(FlxColor.WHITE, 1, function()
		{
			PlayState.getBoss = selectBoss;
			FlxG.switchState(new PlayState());
		});
	}

	function get_shop()
	{
		FlxG.camera.flash(FlxColor.WHITE, 1, function()
		{
			openSubState(new WarmSubState("!HEY!\nThat Feature is not working yet!\nPlease wait for a update!\n\nPress ANY Key to close", false));
		});
	}

	function get_options()
	{
		FlxG.camera.flash(FlxColor.WHITE, 1, function()
		{
			// FlxG.switchState(new PlayState());
		});
	}

	#if sys
	function get_exit()
	{
		FlxG.camera.flash(FlxColor.WHITE, 1, function()
		{
			Sys.exit(1);
		});
	}
	#end
}
