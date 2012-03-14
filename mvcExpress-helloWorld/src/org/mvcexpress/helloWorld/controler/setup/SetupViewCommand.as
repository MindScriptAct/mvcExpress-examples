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
	
	public function execute(blank:Object):void {
		trace( "SetupViewCommand.execute > blank : " + blank );
		
		// Will map mediator class to view class.
		// Mediator(MainMediator) will be automaticaly created every time you will try to mediatorMap.mediate() viewObject of mapped class(Main).
		mediatorMap.map(Main, MainMediator);
	}
	
}
}