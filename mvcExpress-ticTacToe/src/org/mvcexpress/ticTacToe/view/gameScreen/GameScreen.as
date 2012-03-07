package org.mvcexpress.ticTacToe.view.gameScreen {
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.MouseEvent;
import org.mvcexpress.ticTacToe.view.gameScreen.components.BoardBackground;

/**
 * COMMENT
 * @author
 */
public class GameScreen extends Sprite {
	static private const CELL_SIZE:Number = 100;
	
	private var backGround:BoardBackground;
	
	public function GameScreen() {
		
		backGround = new BoardBackground();
		this.addChild(backGround);
		backGround.x = 50;
		backGround.y = 50;
		
		backGround.addEventListener(MouseEvent.CLICK, handleBackClick);
	}
	
	private function handleBackClick(event:MouseEvent):void {
		dispatchEvent(new GameScreenEvent(GameScreenEvent.CELL_CLICK, Math.floor(backGround.mouseX / CELL_SIZE), Math.floor(backGround.mouseY / CELL_SIZE)));
	}

}
}