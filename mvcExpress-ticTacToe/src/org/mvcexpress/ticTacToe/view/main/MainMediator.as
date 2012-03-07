package org.mvcexpress.ticTacToe.view.main{
import org.mvcexpress.ticTacToe.Main;
import org.mvcexpress.mvc.Mediator;

/**
 * Mediator for aplication root view object.
 */
public class MainMediator extends Mediator {
	
	[Inject]
	public var view:Main;
	
	override public function onRegister():void {
		
	}
	
	override public function onRemove():void {
		
	}
	
}
}