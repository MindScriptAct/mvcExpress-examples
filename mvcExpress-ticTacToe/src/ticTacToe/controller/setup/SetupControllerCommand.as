package ticTacToe.controller.setup {
import mvcexpress.mvc.Command;

import ticTacToe.controller.game.CellClickCommand;
import ticTacToe.controller.game.NewGameCommand;
import ticTacToe.messages.ViewMsg;

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