package org.mvcexpress.ticTacToe.model {
import flash.geom.Point;
import org.mvcexpress.mvc.Proxy;
import org.mvcexpress.ticTacToe.constants.TokenId;
import org.mvcexpress.ticTacToe.messages.DataMsg;

/**
 * Game board state proxy.
 */
public class GameBoardProxy extends Proxy {
	
	private var boardData:Vector.<Vector.<int>>;
	
	public function GameBoardProxy() {
	
	}
	
	override protected function onRegister():void {
		boardData = new Vector.<Vector.<int>>(3);
		for (var i:int = 0; i < boardData.length; i++) {
			boardData[i] = new Vector.<int>(3);
		}
	}
	
	override protected function onRemove():void {
		boardData = null;
	}
	
	public function isCellEmpty(cellCords:Point):Boolean {
		return (boardData[cellCords.x][cellCords.y] == TokenId.TAC)
	}
	
	public function setCellToken(cellCords:Point, tockenId:int):void {
		boardData[cellCords.x][cellCords.y] = tockenId;
		sendMessage(DataMsg.CELL_SET, cellCords);
	}
	
	public function getCellToken(cellCords:Point):int {
		return boardData[cellCords.x][cellCords.y];
	}
}
}