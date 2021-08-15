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

class ThankYou extends MusicBeatState
{
	public static var leftState:Bool = false;
	public static var currChanges:String = "dk";

	override function create()
	{

		FlxG.save.data.demoover = true;

		super.create();
		var bg:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('conceptsketch2', 'preload'));
		bg.setGraphicSize(Std.int(bg.width * 0.15));
		bg.screenCenter(Y);
		add(bg);
		
		var OrigamiLogo:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('TheOrigamiKingLogo'));
		OrigamiLogo.setGraphicSize(Std.int(OrigamiLogo.width * 0.3));
		//OrigamiLogo.x += 100;
		//OrigamiLogo.y -= 180;
		OrigamiLogo.alpha = 0.8;
		add(OrigamiLogo);
		
		var txt:FlxText = new FlxText(-150, 0, FlxG.width,
			"Thank you for playing the demo of \n'Friday Night Funkin': The Origami King'\n We hope nothing broke. 
			\n
			To stay updated, follow the team of twitter \nfor some cool announcements coming soon:\n\n @NinKey69 - Director/Artist\n @ArtPanz - Artist\n@200thSnak - Music\n@1emonking - Coding ",
			32);
		
		txt.setFormat("VCR OSD Mono", 28, FlxColor.fromRGB(200, 200, 200), CENTER);
		txt.borderColor = FlxColor.BLACK;
		txt.borderSize = 3;
		txt.borderStyle = FlxTextBorderStyle.OUTLINE;
		txt.screenCenter(Y);
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
		super.update(elapsed);
	}
}
