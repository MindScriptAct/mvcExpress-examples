package ticTacToe {

//import com.mindscriptact.mvcExpressLogger.MvcExpressLogger;

import flash.display.Sprite;
import flash.events.Event;

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

		// add mvcExpress logger for debugging. (press CTRL + ` to open it.)
		//CONFIG::debug {
		//	MvcExpressLogger.init(this.stage);
		//}

		// entry point
		module = new MainModule();
		module.start(this);
	}
}
}