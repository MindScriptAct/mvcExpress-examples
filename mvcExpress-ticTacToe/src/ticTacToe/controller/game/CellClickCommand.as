package ticTacToe.controller.game {
import flash.geom.Point;

import mvcexpress.mvc.Command;

import ticTacToe.model.GameBoardProxy;
import ticTacToe.model.GameProxy;
import ticTacToe.model.LineVO;

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