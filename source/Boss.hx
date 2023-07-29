package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class Boss extends FlxSprite
{
	public var chance:Float;
	public var getCoin:Int;
	public var space:Int;
	public var hitPlayer:Int;

	/**
		system select boss by int
	**/
	public function new(curBoss:Int)
	{
		super();

		switch (curBoss)
		{
			case 0: // GOOLY
				frames = FlxAtlasFrames.fromSparrow(AssetPaths.goolyBoss__png, AssetPaths.goolyBoss__xml);
				animation.addByPrefix("idle", "idle", 24, false);
				animation.addByPrefix("hit", "getHIT", 24, false);
				animation.play("idle", false);
				setBoss(216, -130, 199, 541, 0.5, 0.5, 250, 1, 30, 20, 100);
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		if (health == 0)
		{
			alive = false;
			exists = false;
		}
	}

	function setBoss(x:Float, y:Float, w:Float, h:Float, sc1:Float, sc2:Float, live:Float, hitP:Int, randomChance:Float, spaceCountDown:Int, coin:Int)
	{
		trace("getting setup boss");
		this.x = x;
		this.y = y;
		this.width = w;
		this.height = h;
		scale.set(sc1, sc2);
		this.health = live;
		chance = randomChance;
		FlxG.random.bool(chance);
		getCoin = coin;
		space = spaceCountDown;
		hitPlayer = hitP;
		trace("setup boss done");
	}
}
