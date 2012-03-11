package org.mvcexpress.ticTacToe.view.gameScreen {
import flash.events.MouseEvent;
import flash.geom.Point;
import org.mvcexpress.mvc.Mediator;
import org.mvcexpress.ticTacToe.messages.DataMsg;
import org.mvcexpress.ticTacToe.messages.ViewMsg;
import org.mvcexpress.ticTacToe.model.GameBoardProxy;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class GameScreenMediator extends Mediator {
	
	[Inject]
	public var view:GameScreen;
	
	[Inject]
	public var gameBoardProxy:GameBoardProxy;
	
	override public function onRegister():void {
		//trace("GameScreenMediator.onRegister");
		
		// 
		view.addEventListener(GameScreenEvent.CELL_CLICK, handleCellClick);
		
		view.newGameDispatcher.addEventListener(MouseEvent.CLICK, handleNewGameClick);
		
		addHandler(DataMsg.CELL_SET, handleCellSet);
	}
	
	private function handleCellClick(event:GameScreenEvent):void {
		sendMessage(ViewMsg.CELL_CLICKED, new Point(event.xCell, event.yCell));
	}
	
	private function handleNewGameClick(event:MouseEvent):void {
		trace("GameScreenMediator.handleNewGameClick > event : " + event);
		sendMessage(ViewMsg.NEW_GAME_CLICKED);
	}
	
	public function handleCellSet(cellCords:Point):void {
		view.addTocken(cellCords, gameBoardProxy.getCellToken(cellCords));
	}
	
	override public function onRemove():void {
	
	}

}
}