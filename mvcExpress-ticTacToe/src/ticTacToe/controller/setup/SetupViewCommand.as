package ticTacToe.controller.setup {
import mvcexpress.mvc.Command;

import ticTacToe.Main;
import ticTacToe.view.gameScreen.GameScreen;
import ticTacToe.view.gameScreen.GameScreenMediator;
import ticTacToe.view.main.MainMediator;

/**
 * Initial set up of maping mediator class to view class.
 * mediatorMap.map(viewClass:Class, mediatorClass:Class);
 * @author
 */
public class SetupViewCommand extends Command {

	public function execute(params:Object):void {
		mediatorMap.map(Main, MainMediator);
		mediatorMap.map(GameScreen, GameScreenMediator);
	}

}
}