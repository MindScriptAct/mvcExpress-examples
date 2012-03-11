package org.mvcexpress.ticTacToe.controler.game{
import org.mvcexpress.mvc.Command;
import org.mvcexpress.ticTacToe.model.GameBoardProxy;
	
/**
 * TODO:CLASS COMMENT
 * @author 
 */
public class NewGameCommand extends Command {
	
	[Inject]
	public var gameBoardProxy:GameBoardProxy;
	
	public function execute(params:Object):void {
		gameBoardProxy.clearBoard();
	}
	
}
}