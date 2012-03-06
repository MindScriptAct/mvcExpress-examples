package org.mvcexpress.helloWorld{
import flash.display.Sprite;
import flash.events.Event;

/**
 * Main application class.
 */

[Frame(factoryClass="org.mvcexpress.helloWorld.Preloader")]
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
		// entry point
		module = new MainModule();
		module.start(this);
	}
}
}