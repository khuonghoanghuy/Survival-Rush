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

	var descText:FlxText;
	var hintText:FlxText;

	override public function create()
	{
		super.create();

		var beingX:Int = 47;

		text = new FlxText(183, 72, 268, "Survival Rush", 32);
		text.height = 44;
		text.scrollFactor.set();
		text.alignment = CENTER;
		add(text);

		buttonStart = new FlxButton(beingX, 200, "Start", get_start);
		add(buttonStart);

		buttonShop = new FlxButton(beingX, 250, "Shop", get_shop);
		add(buttonShop);

		buttonOptions = new FlxButton(beingX, 300, "Options", get_options);
		add(buttonOptions);

		#if sys
		buttonExit = new FlxButton(beingX, 350, "Exit", get_exit);
		add(buttonExit);
		#end

		selectText = new FlxText(382, 277, 0, "< " + selectString + " >", 12);
		selectText.alignment = CENTER;
		selectText.scrollFactor.set();
		add(selectText);

		descText = new FlxText(358, 258, 0, "", 16);
		descText.scrollFactor.set();
		descText.alignment = CENTER;
		add(descText);

		hintText = new FlxText(10, FlxG.height - 22, 0, "PRESS R TO PLAY AS RUSH MODE: " + FlxG.save.data.rushMode, 12);
		hintText.scrollFactor.set();
		hintText.alignment = LEFT;
		add(hintText);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		hintText.text = "PRESS R TO PLAY AS RUSH MODE: " + FlxG.save.data.rushMode;

		selectText.text = "< " + selectString + " >";

		switch (selectBoss)
		{
			case 0:
				selectString = "GOOLY GUY";
				descText.text = "A Basic Boss Guy";
			case 1:
				selectString = "MAN WITH STICK";
				descText.text = "That guy had a Stick!";
			case 2:
				selectString = "A BALL";
				descText.text = "Why a ball here?";
		}

		if (FlxG.keys.justPressed.LEFT)
		{
			if (selectBoss == 0)
			{
				selectBoss = 2;
			}
			else
			{
				selectBoss--;
			}
		}

		if (FlxG.keys.justPressed.RIGHT)
		{
			if (selectBoss == 2)
			{
				selectBoss = 0;
			}
			else
			{
				selectBoss++;
			}
		}

		if (FlxG.keys.justPressed.R)
		{
			FlxG.save.data.rushMode = !FlxG.save.data.rushMode;
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
			// openSubState(new WarmSubState("!HEY!\nThat Feature is not working yet!\nPlease wait for a update!\n\nPress ANY Key to close", false));
			FlxG.switchState(new OptionsState());
		});
	}

	#if sys
	function get_exit()
	{
		FlxG.camera.flash(FlxColor.WHITE, 1, function()
		{
			FlxG.save.flush();
			Sys.exit(1);
		});
	}
	#end
}
