package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.text.FlxText;

class PlayState extends MainState
{
	public static var getBoss:Int = 0;

	var bossSprite:Boss;

	var playerHealth:Int = 5;
	var infoText:FlxText;

	var buttonFIGHT:FlxSprite;

	var buttonSPACE:FlxSprite;

	override public function create()
	{
		super.create();

		bossSprite = new Boss(getBoss);
		add(bossSprite);

		infoText = new FlxText(10, 40, 0, "Player: " + playerHealth + "\n\nBoss: " + bossSprite.health, 12);
		infoText.scrollFactor.set();
		add(infoText);

		var buttonTex = FlxAtlasFrames.fromSparrow(AssetPaths.buttonSelect__png, AssetPaths.buttonSelect__xml);

		buttonFIGHT = new FlxSprite(60, 310);
		buttonFIGHT.frames = buttonTex;
		buttonFIGHT.animation.addByPrefix("idle", "fight");
		buttonFIGHT.animation.addByPrefix("select", "fight_select");
		buttonFIGHT.scrollFactor.set();
		buttonFIGHT.animation.play("idle");
		add(buttonFIGHT);

		buttonSPACE = new FlxSprite(375, 310);
		buttonSPACE.frames = buttonTex;
		buttonSPACE.animation.addByPrefix("idle", "space");
		buttonSPACE.animation.addByPrefix("select", "space_select");
		buttonSPACE.scrollFactor.set();
		buttonSPACE.animation.play("idle");
		add(buttonSPACE);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		var daFight = false;
		var daSpace = false;

		infoText.text = "Player: " + playerHealth + "\nBoss: " + bossSprite.health;

		// fight button
		if (FlxG.mouse.overlaps(buttonFIGHT) && FlxG.mouse.justPressed)
		{
			buttonFIGHT.animation.play("select");
			daFight = true;
		}

		// space button
		if (FlxG.mouse.overlaps(buttonSPACE) && FlxG.mouse.justPressed)
		{
			buttonSPACE.animation.play("select");
			daSpace = true;
		}

		if (daFight)
		{
			if (FlxG.random.bool(bossSprite.chance))
			{
				bossSprite.animation.play("idle", false);
				bossSprite.health -= 0;
				trace("boss dodge that hit, no health was minus");
			}
			else
			{
				bossSprite.animation.play("hit", false);
				bossSprite.health -= 10; // basic weapon
				trace("player hit boss, boss only have " + bossSprite.health + " live left");
			}
		}
		else
		{
			bossSprite.animation.play("idle", false);
			daFight = false;
			playerHealth -= bossSprite.hitPlayer;
		}

		if (daSpace)
		{
			bossSprite.space--;
			daSpace = false;
		}

		// fight
		if (bossSprite.alive == false && bossSprite.exists == false && bossSprite.health == 0)
		{
			openSubState(new WarmSubState("YOU WIN\nYes you are win this game!\n\nPress ANY Key to return Main Menu", true));
		}

		// space
		if (bossSprite.alive == true && bossSprite.exists == true && bossSprite.space == 0)
		{
			openSubState(new WarmSubState("YOU WIN\nYes you are win this game!\nYou Not Press Fight and You just Hit Space\n\nPress ANY Key to return Main Menu",
				true));
		}
	}
}
