package ;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;
class Player extends FlxSprite
{
	private var NORMAL_SPEED=120;

	public function new()
	{
		super(10,FlxG.height-50);
		makeGraphic(10,10,0xFFFFFFFF);
		acceleration.y = 200;
		maxVelocity.y = 2000;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		velocity.x = 0;
		if(InputHandler.LEFT() && !InputHandler.RIGHT())
		{
			velocity.x = -1 * NORMAL_SPEED;
		}
		if(InputHandler.RIGHT() && !InputHandler.LEFT())
		{
			velocity.x = 1 * NORMAL_SPEED;
		}
		if(InputHandler.JUMP())
		{
			velocity.y = -100000;
		}
	}
}
