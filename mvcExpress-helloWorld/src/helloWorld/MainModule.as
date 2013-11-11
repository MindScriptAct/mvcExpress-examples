package helloWorld {
import flash.geom.Point;

import helloWorld.controller.setup.SetupControllerCommand;
import helloWorld.controller.setup.SetupModelCommand;
import helloWorld.controller.setup.SetupViewCommand;
import helloWorld.messages.DataMessage;
import helloWorld.messages.Message;
import helloWorld.messages.ViewMessage;

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
			checkClassStringConstants(Message, DataMessage, ViewMessage);
		}

		// map commands (you can map them here.. or move it to command.)
		commandMap.execute(SetupControllerCommand);

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
		// messages can be sent from modules, commands, proxies and mediators.
		// messages can execute commands, and be handled by mediators.
		// params object is optional.
		sendMessage(Message.TEST, new Point(1, 5));

		trace("Hello mvcExpress!!!");
	}

}
}