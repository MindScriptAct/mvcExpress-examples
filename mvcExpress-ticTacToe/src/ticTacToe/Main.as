package ticTacToe {

//import mindscriptact.mvcExpressLogger.MvcExpressLogger;
import mindscriptact.mvcExpressLogger.MvcExpressLogger;

import flash.display.Sprite;
import flash.events.Event;

import mvcexpress.utils.checkClassStringConstants;

import ticTacToe.messages.DataMessages;
import ticTacToe.messages.Messages;
import ticTacToe.messages.ViewMessages;

/**
 * Main application class.
 */

[Frame(factoryClass="ticTacToe.Preloader")]

public class Main extends Sprite {

	private var module:MainModule;

	public function Main():void {

		if (stage) {
			init();
		} else {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
	}

	private function init(event:Event = null):void {
		removeEventListener(Event.ADDED_TO_STAGE, init);

		// add mvcExpress logger for debugging. (press CTRL + ` to toggle it.)
		CONFIG::debug {
			MvcExpressLogger.init(this.stage, 330, 0, 870, 400, 1, true);
			checkClassStringConstants(Messages, DataMessages, ViewMessages);
		}

		// entry point
		module = new MainModule();
		module.start(this);
	}
}
}