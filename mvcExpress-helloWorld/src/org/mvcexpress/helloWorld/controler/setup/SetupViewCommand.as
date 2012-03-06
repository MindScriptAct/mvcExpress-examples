package org.mvcexpress.helloWorld.controler.setup{
import org.mvcexpress.mvc.Command;
import org.mvcexpress.helloWorld.Main;
import org.mvcexpress.helloWorld.view.main.MainMediator;
	
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