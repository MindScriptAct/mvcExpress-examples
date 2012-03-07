package org.mvcexpress.ticTacToe.controler.setup{
import org.mvcexpress.mvc.Command;
import org.mvcexpress.ticTacToe.controler.game.CellClickCommand;
import org.mvcexpress.ticTacToe.messages.ViewMsg;
	
/**
 * Initial set up of maping commands to messages.
 * commandMap.map(type:String, commandClass:Class);
 * @author 
 */
public class SetupControlerCommand extends Command {
	
	public function execute(params:Object):void {
		commandMap.map(ViewMsg.CELL_CLICKED, CellClickCommand);
	}
	
}
}