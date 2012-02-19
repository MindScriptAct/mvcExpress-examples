package org.mvcexpress.firstsample.view.main {
import flash.display.Sprite;
import org.mvcexpress.firstsample.constants.Screens;
import org.mvcexpress.firstsample.Main;
import org.mvcexpress.firstsample.notes.Note;
import org.mvcexpress.firstsample.view.gameScreen.GameScreen;
import org.mvcexpress.firstsample.view.menuScreen.MenuScreen;
import org.mvcexpress.mvc.Mediator;
import utils.debug.Stats;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class MainMediator extends Mediator {
	
	[Inject]
	public var view:Main;
	
	private var screen:Sprite;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		
		addHandler(Note.SHOW_SCREEN, handleShowScreen);
	}
	
	private function handleShowScreen(screenName:String):void {
		// if screen is already shown - unmediate it and remove.
		if (screen) {
			view.removeChild(screen);
			mediatorMap.unmediate(screen);
			screen = null;
		}
		// set new screen sprite object.
		switch (screenName) {
			case Screens.MENU: 
				screen = new MenuScreen();
				break;
			case Screens.GAME: 
				screen = new GameScreen();
				break;
			default: 
		}
		// if new screen is set - add it and mediate.
		if (screen) {
			view.addChild(screen);
			mediatorMap.mediate(screen);
		}
	}
	
	override public function onRemove():void {
	
	}

}
}