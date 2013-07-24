package modularProject.modules.console.controller.setup {
import modularProject.modules.console.Console;
import modularProject.modules.console.view.ConsoleMediator;

import mvcexpress.mvc.Command;

/**
 * set up view
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class SetUpConsoleViewCommand extends Command {

	public function execute(blank:Object):void {
		mediatorMap.map(Console, ConsoleMediator);
	}

}
}
