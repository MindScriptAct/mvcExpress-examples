package ticTacToe.view.main {
import mvcexpress.mvc.Mediator;

import ticTacToe.Main;
import ticTacToe.view.gameScreen.GameScreen;

/**
 * Mediator for aplication root view object.
 */
public class MainMediator extends Mediator {

	[Inject]
	public var view:Main;

	private var gameScreen:GameScreen;

	override protected function onRegister():void {
		gameScreen = new GameScreen();
		view.addChild(gameScreen);
		mediatorMap.mediate(gameScreen);
	}

	override protected function onRemove():void {
		mediatorMap.unmediate(gameScreen);
		view.removeChild(gameScreen);
	}

}
}