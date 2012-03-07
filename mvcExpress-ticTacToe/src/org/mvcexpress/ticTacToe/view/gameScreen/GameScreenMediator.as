package org.mvcexpress.ticTacToe.view.gameScreen {
import flash.events.MouseEvent;
import flash.geom.Point;
import org.mvcexpress.mvc.Mediator;
import org.mvcexpress.ticTacToe.messages.ViewMsg;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class GameScreenMediator extends Mediator {
	
	[Inject]
	public var view:GameScreen;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		trace("GameScreenMediator.onRegister");
		
		// 
		view.addEventListener(GameScreenEvent.CELL_CLICK, handleCellClick);
	}
	
	private function handleCellClick(event:GameScreenEvent):void {
		sendMessage(ViewMsg.CELL_CLICKED, new Point(event.xCell, event.yCell));
	}
	
	override public function onRemove():void {
	
	}

}
}