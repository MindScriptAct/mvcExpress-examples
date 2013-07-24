package modularProject.modularSample.controller.setup {
import modularProject.modularSample.ModularSample;

import mvcexpress.mvc.Command;

/**
 * init medule
 * @author rbanevicius
 */
public class InitModularSampleCommand extends Command {

	public function execute(main:ModularSample):void {
		// mediate module object.
		mediatorMap.mediate(main);
	}

}
}
