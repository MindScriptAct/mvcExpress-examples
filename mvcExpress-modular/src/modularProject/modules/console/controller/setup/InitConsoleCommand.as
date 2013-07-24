package modularProject.modules.console.controller.setup {
import modularProject.modules.console.Console;

import mvcexpress.mvc.Command;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class InitConsoleCommand extends Command {

	public function execute(main:Console):void {

		// start main view.
		mediatorMap.mediate(main);
	}

}
}
