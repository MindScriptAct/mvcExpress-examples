package ticTacToe.view.gameScreen {
import flash.events.MouseEvent;
import flash.geom.Point;

import mvcexpress.mvc.Mediator;

import ticTacToe.messages.DataMessages;
import ticTacToe.messages.ViewMessages;
import ticTacToe.model.GameBoardProxy;
import ticTacToe.model.LineVO;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class GameScreenMediator extends Mediator {

	[Inject]
	public var view:GameScreen;

	[Inject]
	public var gameBoardProxy:GameBoardProxy;

	override protected function onRegister():void {
		//trace("GameScreenMediator.onRegister");

		//
		view.addEventListener(GameScreenEvent.CELL_CLICK, handleCellClick);

		view.newGameDispatcher.addEventListener(MouseEvent.CLICK, handleNewGameClick);

		addHandler(DataMessages.CELL_SET, handleCellSet);
		addHandler(DataMessages.BOARD_CLEARED, handleBoardCleared);
		addHandler(DataMessages.LINE_FOUND, handleLineFound);
	}

	private function handleCellClick(event:GameScreenEvent):void {
		sendMessage(ViewMessages.CELL_CLICKED, new Point(event.xCell, event.yCell));
	}

	private function handleNewGameClick(event:MouseEvent):void {
		//trace("GameScreenMediator.handleNewGameClick > event : " + event);
		sendMessage(ViewMessages.NEW_GAME_CLICKED);
	}

	public function handleCellSet(cellCords:Point):void {
		view.addToken(cellCords, gameBoardProxy.getCellToken(cellCords));
	}

	private function handleBoardCleared(params:Object):void {
		view.clearBoard();
	}

	private function handleLineFound(lineVo:LineVO):void {
		view.drawLine(lineVo.fromPos, lineVo.toPos);
	}

	override protected function onRemove():void {

	}

}
}