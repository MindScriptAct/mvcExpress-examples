package org.mvcexpress.ticTacToe.controller.setup {
import org.mvcexpress.mvc.Command;
import org.mvcexpress.ticTacToe.controller.game.CellClickCommand;
import org.mvcexpress.ticTacToe.controller.game.NewGameCommand;
import org.mvcexpress.ticTacToe.messages.ViewMsg;

/**
 * Initial set up of maping commands to messages.
 * commandMap.map(type:String, commandClass:Class);
 * @author
 */
public class SetupControllerCommand extends Command {
	
	public function execute(params:Object):void {
		commandMap.map(ViewMsg.CELL_CLICKED, CellClickCommand);
		commandMap.map(ViewMsg.NEW_GAME_CLICKED, NewGameCommand);
	}

}
}