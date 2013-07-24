package modularProject.modularSample.controller.setup {
import modularProject.global.ScopeNames;

import mvcexpress.mvc.Command;

/**
 * set permision te send messages to this scope.
 * @author rbanevicius
 */
public class SetUpPermissionsCommand extends Command {

	public function execute(blank:Object):void {
		//
		registerScope(ScopeNames.CONSOLE_SCOPE, true, false);
	}

}
}
