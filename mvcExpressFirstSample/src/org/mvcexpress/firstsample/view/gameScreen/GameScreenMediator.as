package org.mvcexpress.firstsample.view.gameScreen {
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.ui.Keyboard;
import org.mvcexpress.firstsample.constants.KeyCodes;
import org.mvcexpress.firstsample.constants.Screens;
import org.mvcexpress.firstsample.notes.Note;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class GameScreenMediator extends Mediator {
	
	[Inject]
	public var view:GameScreen;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		view.menuBtn.addEventListener(MouseEvent.CLICK, handleMenuClick, false, 0, true);
		
		//addHandler(Note.KEY_DOWN, handleKey);
		//addHandler(Note.KEY_UP, handleKey);
		
		view.stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyUp);
		view.stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
		
		mediatorMap.mediate(view.hero);
		
	}
	
	private function handleKeyUp(event:KeyboardEvent):void {
		switch (event.keyCode) {
			case Keyboard.RIGHT: 
			case Keyboard.D: 
			case Keyboard.E: // dworak
				sendMessage(Note.KEY_PRESS, KeyCodes.RIGHT);
				break;
			case Keyboard.LEFT: 
			case Keyboard.A:
				sendMessage(Note.KEY_PRESS, KeyCodes.LEFT);
				break;
			default: 
		}
	
	}
	
	private function handleKeyDown(event:KeyboardEvent):void {
	
	}
	
	private function handleKey(key:uint):void {
		switch (key) {
			case Keyboard.LEFT: 
			case Keyboard.A: 
				view.hero.x -= 10;
				break;
			case Keyboard.RIGHT: 
			case Keyboard.E: 
			case Keyboard.D: 
				view.hero.x += 10;
				break;
			default: 
		}
	}
	
	// on menu button press - send message to show menu screen!
	private function handleMenuClick(event:MouseEvent):void {
		sendMessage(Note.STOP_GAME);
	}
	
	override public function onRemove():void {
		view.dispose();
	}

}
}