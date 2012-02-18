package org.mvcexpress.firstsample {
import org.mvcexpress.core.ModuleCore;
import org.mvcexpress.firstsample.controler.setup.SetupControlerCommand;
import org.mvcexpress.firstsample.controler.setup.SetupModelCommand;
import org.mvcexpress.firstsample.controler.setup.SetupViewCommand;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class MainModule extends ModuleCore {
	
	override protected function onInit():void {
		// map commands
		commandMap.execute(SetupControlerCommand);
		// map proxies (and services)
		commandMap.execute(SetupModelCommand);
		// map modiators
		commandMap.execute(SetupViewCommand);
	}
	
	public function start(main:Main):void {
		trace("Hello mvcExpress!!!");
		// mediate main view.
		mediatorMap.mediate(main);
	}

}
}