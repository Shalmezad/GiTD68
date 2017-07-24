package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	private var _player:Player;
	private var _lava:FlxSprite;

	override public function create():Void
	{
		super.create();
		_player = new Player();
		_lava = new FlxSprite(0,FlxG.height-20);
		_lava.makeGraphic(FlxG.width, 20,0xFFFF0000);
		_lava.immovable = true;

		add(_player);
		add(_lava);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(_player, _lava);
	}
}
