package org.mvcexpress.firstsample.view.gameScreen {
import com.bit101.components.PushButton;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import org.mvcexpress.firstsample.constants.MainConfig;
import org.mvcexpress.firstsample.notes.Note;
import org.mvcexpress.firstsample.view.hero.Hero;
import utils.debug.Stats;

/**
 * COMMENT
 * @author
 */
public class GameScreen extends Sprite {
	private var stats:Stats;
	
	private var scoreText:TextField;
	
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
		hero.y = MainConfig.HERO_Y_POS;
		//
		initScore();
	}
	
	private function initScore():void {
		scoreText = new TextField();
		this.addChild(scoreText);
		scoreText.text = '-';
		scoreText.width = 200;
		scoreText.mouseEnabled = false;
		scoreText.selectable = false;
		
		var scoreTF:TextFormat = new TextFormat();
		scoreTF.size = 24;
		scoreTF.font = 'Verdana';
		scoreTF.align = TextFormatAlign.CENTER;
		
		scoreText.defaultTextFormat = scoreTF;
		
		scoreText.x = MainConfig.STAGE_WIDTH / 2 - scoreText.width / 2;
	}
	
	public function dispose():void {
		this.removeChild(stats);
	}
	
	public function updateScore(score:int):void {
		scoreText.text = String(score);
	}

}
}