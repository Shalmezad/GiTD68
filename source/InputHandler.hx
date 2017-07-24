package ;
import flixel.FlxG;
class InputHandler
{
	public static function JUMP():Bool
	{
		return FlxG.keys.pressed.W || FlxG.keys.pressed.UP || FlxG.keys.pressed.SPACE;
	}

	public static function LEFT():Bool
	{
		return FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT;
	}

	public static function RIGHT():Bool
	{
		return FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT;
	}
}
