package org.mvcexpress.ticTacToe.view.main {
import org.mvcexpress.mvc.Mediator;
import org.mvcexpress.ticTacToe.Main;
import org.mvcexpress.ticTacToe.view.gameScreen.GameScreen;

/**
 * Mediator for aplication root view object.
 */
public class MainMediator extends Mediator {
	
	[Inject]
	public var view:Main;
	
	private var gameScreen:GameScreen;
	
	override public function onRegister():void {
		gameScreen = new GameScreen();
		view.addChild(gameScreen);
		mediatorMap.mediate(gameScreen);
	}
	
	override public function onRemove():void {
		mediatorMap.unmediate(gameScreen);
		view.removeChild(gameScreen);
	}

}
}