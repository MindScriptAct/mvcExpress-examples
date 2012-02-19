package org.mvcexpress.firstsample.view.hero {
import flash.display.Sprite;
import mx.core.BitmapAsset;

/**
 * COMMENT
 * @author
 */
public class Hero extends Sprite {
	
	[Embed("/pics/hero.png")]
	private var HeroPic:Class;
	
	public function Hero() {
		var heroPic:BitmapAsset = new HeroPic();
		heroPic.move(-28, -4);
		addChild(heroPic);
	}

}
}