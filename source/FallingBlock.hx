package ;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxRandom;
class FallingBlock extends FlxSprite
{
	private static var rand:FlxRandom = new FlxRandom();
	public function new()
	{
		super(Math.random() * FlxG.width, -40);
		makeGraphic(40,20,0xFFBBBBBB);
		velocity.y = 60;
		immovable = true;
	}


	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(y > FlxG.height)
		{
			kill();
		}
	}

	override public function revive():Void
	{
		x = Math.random() * FlxG.width;
		y = -40;
		// Pick a graphic:
		loadGraphic(rand.getObject([
			"assets/images/burrito.png",
			"assets/images/butterfly.png",
			"assets/images/die.png",
			"assets/images/pencil.png",
			"assets/images/snake.png"
		]));

		super.revive();
	}


}
