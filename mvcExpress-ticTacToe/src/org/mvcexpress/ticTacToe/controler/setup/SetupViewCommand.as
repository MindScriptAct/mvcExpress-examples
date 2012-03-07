package org.mvcexpress.ticTacToe.controler.setup{
import org.mvcexpress.mvc.Command;
import org.mvcexpress.ticTacToe.Main;
import org.mvcexpress.ticTacToe.view.main.MainMediator;
	
/**
 * Initial set up of maping mediator class to view class.
 * mediatorMap.map(viewClass:Class, mediatorClass:Class);
 * @author 
 */
public class SetupViewCommand extends Command {
	
	public function execute(params:Object):void {
		mediatorMap.map(Main, MainMediator);
	}
	
}
}