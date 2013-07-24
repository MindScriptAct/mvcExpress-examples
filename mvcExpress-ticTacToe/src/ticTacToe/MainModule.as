package ticTacToe {
import mvcexpress.MvcExpress;
import mvcexpress.modules.ModuleCore;
import mvcexpress.utils.checkClassStringConstants;

import ticTacToe.controller.setup.SetupControllerCommand;
import ticTacToe.controller.setup.SetupModelCommand;
import ticTacToe.controller.setup.SetupViewCommand;
import ticTacToe.messages.DataMsg;
import ticTacToe.messages.Msg;
import ticTacToe.messages.ViewMsg;

/**
 * Main application module.
 * Sets up application and starts it.
 */
public class MainModule extends ModuleCore {

	override protected function onInit():void {

		// little utility to prevent accidental message constant dublications.
		CONFIG::debug {
			checkClassStringConstants(Msg, DataMsg, ViewMsg);

			MvcExpress.debugFunction = trace;
		}

		// map commands
		commandMap.execute(SetupControllerCommand);
		// map proxies (and services)
		commandMap.execute(SetupModelCommand);
		// map modiators
		commandMap.execute(SetupViewCommand);
	}

	public function start(main:Main):void {
		//trace("Hello mvcExpress!!!");
		// mediate main view.
		mediatorMap.mediate(main);
	}

}
}