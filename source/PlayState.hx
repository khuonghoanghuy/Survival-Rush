package;

import flixel.FlxG;
import flixel.text.FlxText;

class PlayState extends MainState
{
	public static var getBoss:Int = 0;

	var bossSprite:Boss;

	var playerHealth:Int = 5;
	var infoText:FlxText;

	override public function create()
	{
		super.create();

		bossSprite = new Boss(getBoss);
		add(bossSprite);

		infoText = new FlxText(50, 50, 0, "Player: " + playerHealth + "\nBoss: " + bossSprite.health, 12);
		infoText.scrollFactor.set();
		add(infoText);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		infoText.text = "Player: " + playerHealth + "\nBoss: " + bossSprite.health;

		if (FlxG.keys.justPressed.ENTER)
		{
			bossSprite.animation.play("hit", false);
			bossSprite.health -= 10; // basic weapon
			trace("player hit boss, boss only have " + bossSprite.health + " live left");
		}
		else
		{
			bossSprite.animation.play("idle", false);
		}

		if (bossSprite.alive == false && bossSprite.exists == false && bossSprite.health == 0)
		{
			openSubState(new WarmSubState("YOU WIN\nYes you are win this game!", true));
		}
	}
}
