package modularProject.modularSample.controller.setup {
import modularProject.global.ScopeNames;
import modularProject.modularSample.ModularSample;
import modularProject.modularSample.view.ModularSampleMediator;

import mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class InitModularSampleCommand extends Command {

	public function execute(main:ModularSample):void {


		// set permision te send messages to this scope.
		registerScope(ScopeNames.CONSOLE_SCOPE, true, false);

		mediatorMap.map(ModularSample, ModularSampleMediator);

		mediatorMap.mediate(main);
	}

}
}
