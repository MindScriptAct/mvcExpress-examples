package modularProject.modules.console.controller.setup {
import modularProject.global.ScopeNames;

import mvcexpress.mvc.Command;

/**
 * set permision te receive messages to this scope. Commands use received messages to trigger.
 * @author rbanevicius
 */
public class SetUpConsolePermissionsCommand extends Command {

	public function execute(blank:Object):void {

		registerScope(ScopeNames.CONSOLE_SCOPE, false, true);
	}

}
}
