package modularProject.modules.console.controller.setup {
import modularProject.global.ScopeNames;
import modularProject.global.messages.GlobalMessage;
import modularProject.modules.console.controller.HandleInputCommand;
import modularProject.modules.console.controller.HandleTargetedMessageCommand;
import modularProject.modules.console.msg.ConsoleViewMessages;

import mvcexpress.mvc.Command;

/**
 * set up commands
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class SetUpConsoleControllerCommand extends Command {

	public function execute(blank:Object):void {

		commandMap.map(ConsoleViewMessages.INPUT_MESSAGE, HandleInputCommand);

		commandMap.scopeMap(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_INPUT_MESSAGE_TO_ALL, HandleInputCommand);
		commandMap.scopeMap(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_TARGETED_INPUT_MESSAGE, HandleTargetedMessageCommand);
	}

}
}
