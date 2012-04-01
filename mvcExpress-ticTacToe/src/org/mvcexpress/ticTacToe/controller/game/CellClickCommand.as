package org.mvcexpress.ticTacToe.controller.game {
import flash.geom.Point;
import org.mvcexpress.mvc.Command;
import org.mvcexpress.ticTacToe.messages.DataMsg;
import org.mvcexpress.ticTacToe.messages.Msg;
import org.mvcexpress.ticTacToe.model.GameBoardProxy;
import org.mvcexpress.ticTacToe.model.GameProxy;
import org.mvcexpress.ticTacToe.model.LineVO;

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
		if (gameProxy.getIsEnabled()) {
			if (gameBoardProxy.isCellEmpty(cellCords)) {
				//
				gameBoardProxy.setCellToken(cellCords, gameProxy.getCurrentToken())
				gameProxy.switchCurrentToken();
				//
				var lineVo:LineVO = gameBoardProxy.findLine();
				if (lineVo) {
					trace("lineVo : " + lineVo);
					// block game...
					gameProxy.disable();
				}
			}
		}
	}

}
}