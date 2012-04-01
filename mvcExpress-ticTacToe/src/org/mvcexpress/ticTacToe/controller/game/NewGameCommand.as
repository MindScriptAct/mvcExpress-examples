package org.mvcexpress.ticTacToe.controller.game {
import org.mvcexpress.mvc.Command;
import org.mvcexpress.ticTacToe.model.GameBoardProxy;
import org.mvcexpress.ticTacToe.model.GameProxy;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class NewGameCommand extends Command {
	
	[Inject]
	public var gameBoardProxy:GameBoardProxy;
	
	[Inject]
	public var gameProxy:GameProxy;
	
	public function execute(params:Object):void {
		gameBoardProxy.clearBoard();
		gameProxy.enable();
	}

}
}