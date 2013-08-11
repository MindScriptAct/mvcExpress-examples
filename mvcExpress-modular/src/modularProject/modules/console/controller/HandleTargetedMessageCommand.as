package modularProject.modules.console.controller {
import modularProject.modules.console.model.ConsoleLogProxy;
import modularProject.modules.console.msg.ConsoleViewMessages;
import modularProject.modules.console.view.ConsoleParams;

import mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class HandleTargetedMessageCommand extends Command {

	[Inject]
	public var consoleLogProxy:ConsoleLogProxy;

	public function execute(consoleParams:ConsoleParams):void {
		for (var i:int = 0; i < consoleParams.targetConsoleIds.length; i++) {
			if (consoleParams.targetConsoleIds[i] == consoleLogProxy.consoleId) {
				sendMessage(ConsoleViewMessages.INPUT_MESSAGE, consoleParams.text);
				break;
			}
		}
	}

}
}