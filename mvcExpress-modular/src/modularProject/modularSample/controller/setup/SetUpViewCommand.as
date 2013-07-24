package modularProject.modularSample.controller.setup {
import modularProject.modularSample.ModularSample;
import modularProject.modularSample.view.ModularSampleMediator;

import mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author rbanevicius
 */
public class SetUpViewCommand extends Command {

	public function execute(blank:Object):void {
		mediatorMap.map(ModularSample, ModularSampleMediator);
	}

}
}
