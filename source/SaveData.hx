package;

import flixel.FlxG;

class SaveData
{
	public static function init()
	{
		if (FlxG.save.data.coin == null)
		{
			FlxG.save.data.coin = 0;
		}

		if (FlxG.save.data.rushMode == null)
		{
			FlxG.save.data.rushMode = false;
		}

		if (FlxG.save.data.harderMode == null)
		{
			FlxG.save.data.harderMode = false;
		}
	}
}
