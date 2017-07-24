package ;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.input.keyboard.FlxKey;
class InputHandler
{
	public static function JUMP():Bool
	{
		return FlxG.keys.anyJustPressed([FlxKey.SPACE, FlxKey.UP, FlxKey.W]);
	}

	public static function LEFT():Bool
	{
		return FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT;
	}

	public static function RIGHT():Bool
	{
		return FlxG.keys.anyPressed([FlxKey.RIGHT, FlxKey.D]);
	}
}
