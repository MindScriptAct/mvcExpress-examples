package modularProject.modules.console.controller {
import modularProject.modules.console.model.ConsoleLogProxy;
import mvcexpress.mvc.Command;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class HandleInputCommand extends Command {

	[Inject]
	public var consoleLogProxy:ConsoleLogProxy;

	public function execute(messageText:String):void {
		//trace("HandleInputCommand.execute > messageText : " + messageText);
		consoleLogProxy.pushMessage(messageText);
	}

}
}