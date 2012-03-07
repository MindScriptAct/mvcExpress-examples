package org.mvcexpress.ticTacToe.view.gameScreen {
import flash.events.Event;

/**
 * COMMENT
 * @author
 */
public class GameScreenEvent extends Event {
	
	static public const CELL_CLICK:String = "cellClick";
	
	public var xCell:int;
	public var yCell:int;
	
	public function GameScreenEvent(type:String, xCell:int, yCell:int) {
		super(type);
		this.xCell = xCell;
		this.yCell = yCell;
	}

}
}