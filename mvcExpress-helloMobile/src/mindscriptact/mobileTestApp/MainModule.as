package mindscriptact.mobileTestApp {
import mindscriptact.mobileTestApp.controler.setup.SetupControlerCommand;
import mindscriptact.mobileTestApp.controler.setup.SetupModelCommand;
import mindscriptact.mobileTestApp.controler.setup.SetupViewCommand;
import mindscriptact.mobileTestApp.messages.DataMsg;
import mindscriptact.mobileTestApp.messages.Msg;
import mindscriptact.mobileTestApp.messages.ViewMsg;

import mvcexpress.modules.ModuleCore;
import mvcexpress.utils.checkClassStringConstants;

/**
 * Main application module.
 * Sets up application and starts it.
 */
public class MainModule extends ModuleCore {

	override protected function onInit():void {
		trace("MainModule.onInit");

		// little utility to prevent accidental message constant dublications.
		CONFIG::debug {
			checkClassStringConstants(Msg, DataMsg, ViewMsg);
		}

		// map commands (you can map them here.. or move it to command.)
		commandMap.execute(SetupControlerCommand);

		// map proxies (and services)(you can map them here.. or move it to command.)
		commandMap.execute(SetupModelCommand);

		// map mediators(you can map them here.. or move it to command.)
		commandMap.execute(SetupViewCommand);
	}

	public function start(main:Main):void {
		trace("MainModule.start > main : " + main);

		// mediate main view.
		mediatorMap.mediate(main);

		// send a message for execution test.
		// messages can be sent from models, commands, proxies and mediators.
		// messages can execute commands, and be handled by mediators.
		// params object is optional.
		//sendMessage(Msg.TEST, new Point(1, 5));

		trace("Hello mvcExpress!!!");
	}

}
}