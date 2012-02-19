package org.mvcexpress.firstsample.controler.setup {
import org.mvcexpress.firstsample.controler.main.StartGameCommand;
import org.mvcexpress.firstsample.controler.main.StopGameCommand;
import org.mvcexpress.firstsample.notes.Note;
import org.mvcexpress.mvc.Command;

/**
 * Initial set up of maping commands to messages they have to be executed on.
 * commandMap.map(type:String, commandClass:Class);
 * @author
 */
public class SetupControlerCommand extends Command {
	
	public function execute(params:Object):void {
		commandMap.map(Note.START_GAME, StartGameCommand);
		commandMap.map(Note.STOP_GAME, StopGameCommand);
	}

}
}