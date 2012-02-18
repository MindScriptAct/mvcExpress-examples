package org.mvcexpress.firstsample.controler.setup {
import org.mvcexpress.firstsample.Main;
import org.mvcexpress.firstsample.view.gameScreen.GameScreen;
import org.mvcexpress.firstsample.view.gameScreen.GameScreenMediator;
import org.mvcexpress.firstsample.view.main.MainMediator;
import org.mvcexpress.firstsample.view.menuScreen.MenuScreen;
import org.mvcexpress.firstsample.view.menuScreen.MenuScreenMediator;
import org.mvcexpress.mvc.Command;

/**
 * Initial set up of maping mediator class to view class.
 * mediatorMap.map(viewClass:Class, mediatorClass:Class);
 * @author
 */
public class SetupViewCommand extends Command {
	
	public function execute(params:Object):void {
		mediatorMap.map(Main, MainMediator);
		
		mediatorMap.map(GameScreen, GameScreenMediator);
		mediatorMap.map(MenuScreen, MenuScreenMediator);
	}

}
}