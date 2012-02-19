package org.mvcexpress.firstsample.view.menuScreen {
import flash.events.MouseEvent;
import org.mvcexpress.firstsample.constants.Screens;
import org.mvcexpress.firstsample.notes.Note;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class MenuScreenMediator extends Mediator {
	
	[Inject]
	public var view:MenuScreen;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		view.startGameBtn.addEventListener(MouseEvent.CLICK, handleStartGameClick, false, 0, true);
	}
	
	// on start game button press - send message to show game screen!
	private function handleStartGameClick(event:MouseEvent):void {
		sendMessage(Note.START_GAME);
	}
	
	override public function onRemove():void {
	
	}

}
}