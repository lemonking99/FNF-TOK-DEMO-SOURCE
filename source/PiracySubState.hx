package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

class PiracySubState extends MusicBeatState
{
	public static var leftState:Bool = false;
	public static var currChanges:String = "dk";

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('conceptsketch3', 'preload'));
		bg.screenCenter();
		add(bg);
		
		var OrigamiLogo:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('TheOrigamiKingLogo'));
		OrigamiLogo.setGraphicSize(Std.int(OrigamiLogo.width * 0.3));
		//OrigamiLogo.x += 100;
		//OrigamiLogo.y -= 180;
		OrigamiLogo.alpha = 0.8;
		add(OrigamiLogo);
		

		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"'If you are reading this, you are most likely playing a pirated version of'\n 'Friday Night Funkin': The Origami King Demo'.\n\nThats totally fine! \nIf you enjoy the mod, all we ask is that you check out the official creators on twitter!! 
			\n\n @NinKey69 - Director/Artist\n @ArtPanz - Artist\n@200thSnak - Music\n@1emonking - Coding (and the one who knows what you're doing (;)
			\n
			Press 1 to enter options, and 2 to be brought to the credits. Press ESC to continue. ",
			32);
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter();
		add(txt);
		


		FlxTween.angle(OrigamiLogo, OrigamiLogo.angle, -10, 2, {ease: FlxEase.quartInOut});
		
		new FlxTimer().start(2, function(tmr:FlxTimer)
		{
			if(OrigamiLogo.angle == -10) FlxTween.angle(OrigamiLogo, OrigamiLogo.angle, 10, 2, {ease: FlxEase.quartInOut});
			else FlxTween.angle(OrigamiLogo, OrigamiLogo.angle, -10, 2, {ease: FlxEase.quartInOut});
		}, 0);
		
		new FlxTimer().start(0.8, function(tmr:FlxTimer)
		{
			if(OrigamiLogo.alpha == 0.8) FlxTween.tween(OrigamiLogo, {alpha: 1}, 0.8, {ease: FlxEase.quartInOut});
			else FlxTween.tween(OrigamiLogo, {alpha: 0.8}, 0.8, {ease: FlxEase.quartInOut});
		}, 0);
	}

	override function update(elapsed:Float)
	{
		if (controls.BACK)
		{
			leftState = true;
			FlxG.switchState(new FreeplayState());
		}
		super.update(elapsed);
	}
}