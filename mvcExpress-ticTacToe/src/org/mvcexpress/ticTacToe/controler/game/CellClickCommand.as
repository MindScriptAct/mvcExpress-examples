package org.mvcexpress.ticTacToe.controler.game {
import flash.geom.Point;
import org.mvcexpress.mvc.Command;
import org.mvcexpress.ticTacToe.model.GameBoardProxy;
import org.mvcexpress.ticTacToe.model.GameProxy;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class CellClickCommand extends Command {
	
	[Inject]
	public var gameBoardProxy:GameBoardProxy;
	
	[Inject]
	public var gameProxy:GameProxy;
	
	public function execute(cellCords:Point):void {
		//trace( "CellClickCommand.execute > cellCords : " + cellCords );
		if (gameBoardProxy.isCellEmpty(cellCords)) {
			gameBoardProxy.setCellToken(cellCords, gameProxy.getCurrentToken())
			gameProxy.switchCurrentToken();
		}
	}

}
}