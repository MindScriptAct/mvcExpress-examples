package org.mvcexpress.ticTacToe.view.gameScreen{
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author 
 */
public class GameScreenMediator extends Mediator {
	
	[Inject]
	public var view:GameScreen;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		trace( "GameScreenMediator.onRegister" );
		
	}
	
	override public function onRemove():void {
		
	}
	
}
}