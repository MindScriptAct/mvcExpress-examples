package modularProject.modules.console.controller.setup {
import modularProject.global.ScopeNames;
import modularProject.global.messages.GlobalMessage;
import modularProject.modules.console.Console;
import modularProject.modules.console.controller.HandleInputCommand;
import modularProject.modules.console.controller.HandleTargetedMessageCommand;
import modularProject.modules.console.model.ConsoleLogProxy;
import modularProject.modules.console.msg.ConsoleViewMessages;
import modularProject.modules.console.view.ConsoleMediator;

import mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class InitConsoleCommand extends Command {

	public function execute(main:Console):void {

		// set permision te receive messages to this scope. Commands use received messages to trigger.
		registerScope(ScopeNames.CONSOLE_SCOPE, false, true);

		// set up commands
		commandMap.map(ConsoleViewMessages.INPUT_MESSAGE, HandleInputCommand);
		commandMap.scopeMap(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_INPUT_MESSAGE_TO_ALL, HandleInputCommand);
		commandMap.scopeMap(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_TARGETED_INPUT_MESSAGE, HandleTargetedMessageCommand);

		// set up view
		proxyMap.map(new ConsoleLogProxy(main.consoleId));
		mediatorMap.map(Console, ConsoleMediator);

		// start main view.

		mediatorMap.mediate(main);
	}

}
}
