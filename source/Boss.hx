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

		var bool:Bool = FlxG.save.data.harderMode; // harder mode

		switch (curBoss)
		{
			case 0: // GOOLY
				frames = FlxAtlasFrames.fromSparrow(AssetPaths.goolyBoss__png, AssetPaths.goolyBoss__xml);
				animation.addByPrefix("idle", "idle", 24, false);
				animation.addByPrefix("hit", "getHIT", 24, false);
				animation.play("idle", false);
				if (bool)
					setupBoss(216, -130, 199, 541, 0.5, 0.5, 100, 2, 35, 20, 100);
				else
					setupBoss(216, -130, 199, 541, 0.5, 0.5, 50, 1, 30, 20, 100);

			case 1: // MAN WITH STICK
				frames = FlxAtlasFrames.fromSparrow(AssetPaths.manWithStick__png, AssetPaths.manWithStick__xml);
				animation.addByPrefix("idle", "idle", 24, false);
				animation.addByPrefix("hit", "getHIT", 24, false);
				animation.play("idle", false);
				if (bool)
					setupBoss(170, -81, 0, 0, 0.5, 0.5, 100, 5, 35, 50, 200);
				else
					setupBoss(170, -81, 0, 0, 0.5, 0.5, 100, 5, 35, 50, 200);

			case 2: // BALL
				frames = FlxAtlasFrames.fromSparrow(AssetPaths.ball__png, AssetPaths.ball__xml);
				animation.addByPrefix("idle", "idle", 24, false);
				animation.addByPrefix("hit", "getHIT", 24, false);
				animation.play("idle", false);
				if (bool)
					setupBoss(188, 48, 0, 0, 0.7, 0.7, 60, 2, 24, 30, 100);
				else
					setupBoss(188, 48, 0, 0, 0.7, 0.7, 30, 1, 21, 15, 100);

			case 3: // GOOLY WITH GUN
				frames = FlxAtlasFrames.fromSparrow(AssetPaths.goolyGun__png, AssetPaths.goolyGun__xml);
				animation.addByPrefix("idle", "idle", 24, false);
				animation.addByPrefix("hit", "getHIT", 24, false);
				animation.play("idle", false);
				if (bool)
					setupBoss(0, 0, 0, 0, 0.5, 0.5, 250, 40, 30, 50, 125);
				else
					setupBoss(0, 0, 0, 0, 0.5, 0.5, 100, 10, 15, 25, 125);

			default: // DEFAULT - GOOLY
				frames = FlxAtlasFrames.fromSparrow(AssetPaths.goolyBoss__png, AssetPaths.goolyBoss__xml);
				animation.addByPrefix("idle", "idle", 24, false);
				animation.addByPrefix("hit", "getHIT", 24, false);
				animation.play("idle", false);
				if (bool)
					setupBoss(216, -130, 199, 541, 0.5, 0.5, 100, 2, 35, 20, 100);
				else
					setupBoss(216, -130, 199, 541, 0.5, 0.5, 50, 1, 30, 20, 100);
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

	/**
		A Simple Base Fully Setup Boss like:
		- X Postion
		- Y Postion
		And other stuff
	**/
	function setupBoss(x:Float, y:Float, w:Float, h:Float, sc1:Float, sc2:Float, live:Float, hitP:Int, randomChance:Float, spaceCountDown:Int, coin:Int)
	{
		trace("getting setup boss");
		this.x = x;
		this.y = y;
		this.width = w;
		this.height = h;
		scale.set(sc1, sc2);
		this.health = live;
		chance = randomChance;
		getCoin = coin;
		space = spaceCountDown;
		hitPlayer = hitP;
		FlxG.random.bool(chance);
		trace("setup boss done");
	}
}
