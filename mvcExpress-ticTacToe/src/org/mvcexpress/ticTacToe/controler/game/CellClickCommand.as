package org.mvcexpress.ticTacToe.controler.game{
import flash.geom.Point;
import org.mvcexpress.mvc.Command;
	
/**
 * TODO:CLASS COMMENT
 * @author 
 */
public class CellClickCommand extends Command {
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	public function execute(cellCords:Point):void {
		trace( "CellClickCommand.execute > cellCords : " + cellCords );
		
	}
	
}
}