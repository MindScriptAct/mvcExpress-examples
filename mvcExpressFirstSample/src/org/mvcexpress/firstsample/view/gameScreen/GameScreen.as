package org.mvcexpress.firstsample.view.gameScreen {
import com.bit101.components.PushButton;
import flash.display.Sprite;
import org.mvcexpress.firstsample.constants.MainConfig;
import org.mvcexpress.firstsample.view.hero.Hero;
import utils.debug.Stats;

/**
 * COMMENT
 * @author
 */
public class GameScreen extends Sprite {
	private var stats:Stats;
	public var hero:Hero;
	public var menuBtn:PushButton;
	
	public function GameScreen() {
		// add fps counter
		stats = new Stats(120, 5, 5, true)
		this.addChild(stats);
		// add menu button
		menuBtn = new PushButton(this, 10, 10, "MENU");
		menuBtn.x = MainConfig.STAGE_WIDTH - menuBtn.width - 10;
		//
		hero = new Hero();
		this.addChild(hero);
		hero.x = MainConfig.STAGE_WIDTH / 2;
		hero.y = MainConfig.HERO_Y_POS;
	}
	
	public function dispose():void {
		this.removeChild(stats);
	}

}
}