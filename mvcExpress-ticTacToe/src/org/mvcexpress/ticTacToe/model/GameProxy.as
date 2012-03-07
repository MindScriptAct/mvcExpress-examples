package org.mvcexpress.ticTacToe.model {
import org.mvcexpress.mvc.Proxy;
import org.mvcexpress.ticTacToe.constants.TokenId;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class GameProxy extends Proxy {
	
	private var currentToken:int = TokenId.TIC;
	
	public function GameProxy() {
	
	}
	
	override protected function onRegister():void {
	
	}
	
	override protected function onRemove():void {
	
	}
	
	public function switchCurrentToken():void {
		currentToken *= -1;
	}
	
	public function getCurrentToken():int {
		return currentToken;
	}

}
}