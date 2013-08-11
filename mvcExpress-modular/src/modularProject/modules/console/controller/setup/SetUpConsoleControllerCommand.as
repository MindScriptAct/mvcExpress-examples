package modularProject.modules.console.controller.setup {
import modularProject.global.ScopeNames;
import modularProject.global.messages.GlobalMessage;
import modularProject.modules.console.controller.HandleInputCommand;
import modularProject.modules.console.controller.HandleTargetedMessageCommand;
import modularProject.modules.console.msg.ConsoleViewMessages;

import mvcexpress.extensions.scoped.mvc.CommandScoped;

/**
 * set up commands
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class SetUpConsoleControllerCommand extends CommandScoped {

	public function execute(blank:Object):void {

		commandMap.map(ConsoleViewMessages.INPUT_MESSAGE, HandleInputCommand);

		commandMapScoped.scopeMap(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_INPUT_MESSAGE_TO_ALL, HandleInputCommand);
		commandMapScoped.scopeMap(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_TARGETED_INPUT_MESSAGE, HandleTargetedMessageCommand);
	}

}
}
