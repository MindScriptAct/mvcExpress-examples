package org.mvcexpress.firstsample.view.gameScreen {
import flash.events.MouseEvent;
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
	
	}
	
	// on menu button press - send message to show menu screen!
	private function handleMenuClick(event:MouseEvent):void {
		sendMessage(Note.SHOW_SCREEN, Screens.MENU);
	}
	
	override public function onRemove():void {
		view.dispose();
	}

}
}