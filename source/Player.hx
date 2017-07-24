package ;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;
class Player extends FlxSprite
{

	private var  RUN_SPEED = 140;
	private var  GRAVITY = 420;
	private var  JUMP_SPEED = 250;

	public function new()
	{
		super(10,FlxG.height-50);
		//makeGraphic(10,10,0xFFFFFFFF);
		loadGraphic("assets/images/player.png");
		acceleration.y = GRAVITY;
		maxVelocity.y = JUMP_SPEED;
	}

	override public function update(elapsed:Float):Void
	{
		velocity.x = 0;
		if(InputHandler.LEFT() && !InputHandler.RIGHT())
		{
			velocity.x = -1 * RUN_SPEED;
		}
		if(InputHandler.RIGHT() && !InputHandler.LEFT())
		{
			velocity.x = 1 * RUN_SPEED;
		}
		if(InputHandler.JUMP() && isTouching(FlxObject.FLOOR))
		{
			velocity.y = -JUMP_SPEED;
		}
		super.update(elapsed);
	}
}
