package org.mvcexpress.helloWorld{
import org.mvcexpress.core.ModuleCore;
import org.mvcexpress.utils.checkClassStringConstants;
import org.mvcexpress.helloWorld.controler.setup.SetupControlerCommand;
import org.mvcexpress.helloWorld.controler.setup.SetupModelCommand;
import org.mvcexpress.helloWorld.controler.setup.SetupViewCommand;
import org.mvcexpress.helloWorld.messages.DataMsg;
import org.mvcexpress.helloWorld.messages.Msg;
import org.mvcexpress.helloWorld.messages.ViewMsg;
	
/**
 * Main application module.
 * Sets up application and starts it.
 */
public class MainModule extends ModuleCore {
	
	override protected function onInit():void {
		
		// little utility to prevent accidental message constant dublications.
		CONFIG::debug {
			checkClassStringConstants(Msg, DataMsg, ViewMsg);
		}
		
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