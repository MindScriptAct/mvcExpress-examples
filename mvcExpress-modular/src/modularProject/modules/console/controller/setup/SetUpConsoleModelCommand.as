package modularProject.modules.console.controller.setup {
import modularProject.modules.console.model.ConsoleLogProxy;

import mvcexpress.mvc.Command;

/**
 * set up model
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class SetUpConsoleModelCommand extends Command {

	public function execute(consoleId:int):void {

		proxyMap.map(new ConsoleLogProxy(consoleId));
	}

}
}
