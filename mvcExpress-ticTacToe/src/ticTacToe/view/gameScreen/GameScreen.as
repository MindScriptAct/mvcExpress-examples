package ticTacToe.view.gameScreen {
import flash.display.Sprite;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import ticTacToe.constants.TokenId;
import ticTacToe.view.gameScreen.components.BoardBackground;
import ticTacToe.view.gameScreen.components.NewGameButton;
import ticTacToe.view.gameScreen.components.Tic;
import ticTacToe.view.gameScreen.components.Toe;

/**
 * COMMENT
 * @author
 */
public class GameScreen extends Sprite {
	static private const CELL_SIZE:Number = 100;

	private var backGround:BoardBackground;
	private var tokens:Vector.<Sprite> = new Vector.<Sprite>();
	private var newGameButton:NewGameButton;
	private var tokenHolder:Sprite;
	private var lineHolder:Sprite;

	//
	public var newGameDispatcher:EventDispatcher;

	public function GameScreen() {

		// add game board view.
		backGround = new BoardBackground();
		this.addChild(backGround);
		backGround.x = 50;
		backGround.y = 50;

		// listen for board clicks
		backGround.addEventListener(MouseEvent.CLICK, handleBackClick);

		// add new game button FXG
		newGameButton = new NewGameButton();
		this.addChild(newGameButton);
		newGameButton.x = 5;
		newGameButton.y = 5;

		// set public variable for newGame click dispacher.
		newGameDispatcher = newGameButton;

		// add text to button.
		var newGameTF:TextField = new TextField();
		newGameButton.addChild(newGameTF);
		newGameTF.text = 'NEW GAME';
		newGameTF.selectable = false;
		newGameTF.mouseEnabled = false;
		newGameTF.width = newGameButton.width;
		newGameTF.height = newGameButton.height;
		var newGameFormat:TextFormat = new TextFormat();
		newGameFormat.size = 20;
		newGameFormat.font = 'Verdana';
		newGameFormat.align = TextFormatAlign.CENTER;
		newGameTF.setTextFormat(newGameFormat);

		// add tokenHolder
		tokenHolder = new Sprite();
		this.addChild(tokenHolder);
		tokenHolder.x = backGround.x;
		tokenHolder.y = backGround.y;

		// add lineHolder
		lineHolder = new Sprite();
		this.addChild(lineHolder);
		lineHolder.x = backGround.x;
		lineHolder.y = backGround.y;
	}

	private function handleBackClick(event:MouseEvent):void {
		dispatchEvent(new GameScreenEvent(GameScreenEvent.CELL_CLICK, Math.floor(backGround.mouseX / CELL_SIZE), Math.floor(backGround.mouseY / CELL_SIZE)));
	}

	public function addToken(cellCords:Point, cellToken:int):void {
		//trace( "GameScreen.addTocken > cellCords : " + cellCords + ", cellToken : " + cellToken );
		var token:Sprite;
		if (cellToken == TokenId.TIC) {
			token = new Tic();
		} else if (cellToken == TokenId.TOE) {
			token = new Toe();
		}

		if (token) {
			token.x = cellCords.x * CELL_SIZE;
			token.y = cellCords.y * CELL_SIZE;
			tokenHolder.addChild(token);
			tokens.push(token);
		}
	}

	public function clearBoard():void {
		while (tokens.length) {
			tokenHolder.removeChild(tokens.pop());
		}
		lineHolder.graphics.clear();
	}

	public function drawLine(fromPos:Point, toPos:Point):void {
		lineHolder.graphics.lineStyle(20, 0x00F23D, 0.8);
		lineHolder.graphics.moveTo(fromPos.x * CELL_SIZE + CELL_SIZE / 2, fromPos.y * CELL_SIZE + CELL_SIZE / 2);
		lineHolder.graphics.lineTo(toPos.x * CELL_SIZE + CELL_SIZE / 2, toPos.y * CELL_SIZE + CELL_SIZE / 2);
	}

}
}