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
	
	public function clearBoard():void {
		for (var i:int = 0; i < boardData.length; i++) {
			for (var j:int = 0; j < boardData[i].length; j++) {
				boardData[i][j] = 0;
			}
		}
		sendMessage(DataMsg.BOARD_CLEARED);
	}
	
	public function findLine():LineVO {
		var retVal:LineVO;
		
		var lineToken:int;
		
		// search horizontals
		for (var j:int = 0; j < boardData.length; j++) {
			lineToken = boardData[0][j];
			if (lineToken && lineToken == boardData[1][j] && lineToken == boardData[2][j]) {
				retVal = new LineVO();
				retVal.fromPos = new Point(0, j);
				retVal.toPos = new Point(2, j);
				retVal.tokenId = lineToken;
				break;
			}
		}
		// search verticals
		for (var i:int = 0; i < boardData.length; i++) {
			lineToken = boardData[i][0];
			if (lineToken && lineToken == boardData[i][1] && lineToken == boardData[i][2]) {
				retVal = new LineVO();
				retVal.fromPos = new Point(i, 0);
				retVal.toPos = new Point(i, 2);
				retVal.tokenId = lineToken;
				break;
			}
		}
		// search diagonals
		lineToken = boardData[1][1];
		if (lineToken && lineToken == boardData[0][0] && lineToken == boardData[2][2]) {
			retVal = new LineVO();
			retVal.fromPos = new Point(0, 0);
			retVal.toPos = new Point(2, 2);
			retVal.tokenId = lineToken;
		}
		if (lineToken && lineToken == boardData[2][0] && lineToken == boardData[0][2]) {
			retVal = new LineVO();
			retVal.fromPos = new Point(2, 0);
			retVal.toPos = new Point(0, 2);
			retVal.tokenId = lineToken;
		}
		if (retVal) {
			sendMessage(DataMsg.LINE_FOUND, retVal);
		}
		
		return retVal;
	}
}
}