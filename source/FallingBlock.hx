package ;
import flixel.FlxSprite;
import flixel.FlxG;
class FallingBlock extends FlxSprite
{
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

		super.revive();
	}


}
