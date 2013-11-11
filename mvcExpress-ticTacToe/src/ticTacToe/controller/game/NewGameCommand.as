package ticTacToe.controller.game {
import mvcexpress.mvc.Command;

import ticTacToe.model.GameBoardProxy;
import ticTacToe.model.GameProxy;

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
		gameProxy.enableGame();
	}

}
}