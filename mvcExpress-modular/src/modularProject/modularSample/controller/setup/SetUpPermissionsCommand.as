package modularProject.modularSample.controller.setup {
import modularProject.global.ScopeNames;

import mvcexpress.extensions.scoped.mvc.CommandScoped;

import mvcexpress.mvc.Command;

/**
 * set permision te send messages to this scope.
 * @author rbanevicius
 */
public class SetUpPermissionsCommand extends CommandScoped {

	public function execute(blank:Object):void {
		//
		registerScope(ScopeNames.CONSOLE_SCOPE, true, false);
	}

}
}
