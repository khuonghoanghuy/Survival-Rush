package;

import flixel.FlxG;
import flixel.addons.ui.FlxButtonPlus;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends MainState
{
	public static var getBoss:Int = 0;

	var bossSprite:Boss;

	var playerHealth:Int = 5;
	var infoText:FlxText;

	var buttonFIGHT:FlxButtonPlus;
	var buttonSPACE:FlxButtonPlus;

	var tunpadTxt:FlxText;

	override public function create()
	{
		super.create();

		bossSprite = new Boss(getBoss);
		add(bossSprite);

		infoText = new FlxText(10, 40, 0, "Player: " + playerHealth + "\n\nBoss: " + bossSprite.health, 12);
		infoText.scrollFactor.set();
		add(infoText);

		buttonFIGHT = new FlxButtonPlus(5, 175, getFIGHT, "FIGHT");
		buttonFIGHT.scrollFactor.set();
		buttonFIGHT.color = FlxColor.RED;
		add(buttonFIGHT);

		buttonSPACE = new FlxButtonPlus(5, 230, getSPACE, "SPACE");
		buttonSPACE.scrollFactor.set();
		add(buttonSPACE);

		tunpadTxt = new FlxText(248, 277, 0, "", 16);
		tunpadTxt.scrollFactor.set();
		tunpadTxt.alignment = CENTER;
		add(tunpadTxt);

		tunpadTxt.text = "BEGIN A FIGHT";
	}

	var daFight:Bool = false;
	var daSpace:Bool = false;

	function getFIGHT()
	{
		daFight = true;
	}

	function getSPACE()
	{
		daSpace = true;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		infoText.text = "Player: " + playerHealth + "\nBoss: " + bossSprite.health;

		if (FlxG.keys.justPressed.ESCAPE)
		{
			openSubState(new WarmSubState("- PAUSE -\nPress ANY Key to resume", false));
		}

		if (daFight)
		{
			tunpadTxt.text = "YOU CHOOSE FIGHT";
			if (FlxG.random.bool(bossSprite.chance))
			{
				bossSprite.animation.play("idle", false);
				bossSprite.health -= 0;
				trace("boss dodge that hit, no health was minus");
				playerHealth -= bossSprite.hitPlayer;
				tunpadTxt.text = "BUT BOSS WAS DODGE\nYOU GET HIT!";
			}
			else
			{
				bossSprite.animation.play("hit", false);
				bossSprite.health -= 10; // basic weapon
				trace("player hit boss, boss only have " + bossSprite.health + " live left");
				tunpadTxt.text = "BOSS HIT YOUR DAMAGE!";
			}
			bossSprite.animation.play("idle", false);
			daFight = false;
		}

		if (daSpace)
		{
			bossSprite.space--;
			daSpace = false;
			tunpadTxt.text = "YOU SPARE BOSS";
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

		// game over
		if (playerHealth == 0)
		{
			// just call `true` anyways
			openSubState(new WarmSubState("YOU LOST\nBETTER LUCK NEXT TIME\n\nPress ANY Key to return Main Menu", true));
		}
	}
}
