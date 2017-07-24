package;

import flixel.math.FlxRandom;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.math.FlxRandom;
import flixel.addons.effects.chainable.FlxEffectSprite;
import flixel.addons.effects.chainable.FlxRainbowEffect;
import flixel.addons.effects.chainable.FlxWaveEffect;

class PlayState extends FlxState
{
	private var _player:Player;
	private var _lava:FlxSprite;
	private var _blocks:FlxTypedGroup<FallingBlock>;
	private var _blockSpawnTime:Float = 2;

	private var _background:FlxSprite;
	private var _effectBackground:FlxEffectSprite;
	private var _rainbow:FlxRainbowEffect;
	private var _wave:FlxWaveEffect;

	override public function create():Void
	{
		super.create();
		_player = new Player();
		_lava = new FlxSprite(0,FlxG.height-20);
		_lava.makeGraphic(FlxG.width, 20,0xFFFF0000);
		_lava.immovable = true;
		_blocks = new FlxTypedGroup<FallingBlock>(20);
		for (i in 0...20)
		{
			var block = new FallingBlock();
			block.kill();
			_blocks.add(block);
		}

		_background = new FlxSprite(0,0);
		_background.loadGraphic("assets/images/background.png");
		_rainbow = new FlxRainbowEffect(0.5);
		_wave = new FlxWaveEffect(FlxWaveMode.ALL);
		_effectBackground = new FlxEffectSprite(_background);
		_effectBackground.effects = [_rainbow, _wave] ;

		add(_effectBackground);
		add(_blocks);
		add(_player);
		add(_lava);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(_player, _lava);
		if(_player.velocity.y > 0)
		{
			FlxG.collide(_player, _blocks);
		}
		_blockSpawnTime -= elapsed;
		if(_blockSpawnTime < 0)
		{
			_blocks.recycle();
			_blockSpawnTime = Math.random() * 1.5;
		}

	}
}
