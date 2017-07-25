package;

import flixel.math.FlxRandom;
import flixel.group.FlxGroup;
import flixel.FlxG;
import flixel.FlxObject;
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
	private var _effectLava:FlxEffectSprite;
	private var _lavaWave:FlxWaveEffect;

	private var _blocks:FlxTypedGroup<FallingBlock>;
	private var _blockSpawnTime:Float = 0;

	private var _background:FlxSprite;
	private var _effectBackground:FlxEffectSprite;
	private var _rainbow:FlxRainbowEffect;
	private var _backgroundWave:FlxWaveEffect;

	private var _gameOverButton:FlxButton;

	override public function create():Void
	{
		super.create();
		_player = new Player();


		_lava = new FlxSprite(0,FlxG.height-18);
		_lava.loadGraphic("assets/images/lava.png");
		_lava.immovable = true;
		_lavaWave = new FlxWaveEffect(FlxWaveMode.ALL, 2, 0.5,3, 5, FlxWaveDirection.VERTICAL);
		_effectLava = new FlxEffectSprite(_lava);
		_effectLava.y = _lava.y;
		_effectLava.effects = [_lavaWave];
		_effectLava.alpha = 0;

		_gameOverButton = new FlxButton(10,10,"Try again?", reset);
		_gameOverButton.visible = false;


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
		_backgroundWave = new FlxWaveEffect(FlxWaveMode.ALL);
		_effectBackground = new FlxEffectSprite(_background);
		_effectBackground.effects = [_rainbow, _backgroundWave] ;

		add(_effectBackground);
		add(_blocks);
		add(_player);
		add(_effectLava);
		add(_gameOverButton);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
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

		if(_effectLava.alpha < 1)
		{
			_effectLava.alpha += elapsed * 0.1;
			FlxG.collide(_player, _lava);
		}
		else
		{
			_effectLava.alpha = 1;
			FlxG.collide(_player, _lava, killPlayer);
		}

	}

	public function killPlayer(a:FlxObject, b:FlxObject):Void
	{
		_player.kill();
		_gameOverButton.visible = true;
	}

	public function reset():Void
	{
		FlxG.switchState(new PlayState());
	}
}
