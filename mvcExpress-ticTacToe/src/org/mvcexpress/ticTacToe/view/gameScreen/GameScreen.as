package org.mvcexpress.ticTacToe.view.gameScreen {
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.display.TriangleCulling;
import flash.events.MouseEvent;
import flash.geom.Point;
import org.mvcexpress.ticTacToe.constants.TokenId;
import org.mvcexpress.ticTacToe.view.gameScreen.components.BoardBackground;
import org.mvcexpress.ticTacToe.view.gameScreen.components.Tic;
import org.mvcexpress.ticTacToe.view.gameScreen.components.Toe;

/**
 * COMMENT
 * @author
 */
public class GameScreen extends Sprite {
	static private const CELL_SIZE:Number = 100;
	
	private var backGround:BoardBackground;
	private var tokens:Vector.<Sprite> = new Vector.<Sprite>();
	
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
	
	public function addTocken(cellCords:Point, cellToken:int):void {
		//trace( "GameScreen.addTocken > cellCords : " + cellCords + ", cellToken : " + cellToken );
		var token:Sprite;
		if (cellToken == TokenId.TIC) {
			token = new Tic();
		} else if (cellToken == TokenId.TOE) {
			token = new Toe();
		}
		
		if (token) {
			token.x = cellCords.x * 100 + backGround.x;
			token.y = cellCords.y * 100 + backGround.y;
			this.addChild(token);
			tokens.push(token);
		}
	}

}
}