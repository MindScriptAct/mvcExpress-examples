package org.mvcexpress.ticTacToe.view.gameScreen {
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import org.mvcexpress.ticTacToe.view.gameScreen.components.BoardBackground;

/**
 * COMMENT
 * @author
 */
public class GameScreen extends Sprite {
	public var backGround:BoardBackground;
	
	public function GameScreen() {
		
		backGround = new BoardBackground();
		this.addChild(backGround);
		backGround.x = 50;
		backGround.y = 50;
	
	}

}
}