package ticTacToe.model {
import mvcexpress.mvc.Proxy;

import ticTacToe.constants.TokenId;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class GameProxy extends Proxy {

	private var currentToken:int = TokenId.TIC;

	private var isEnabled:Boolean = true;

	// current token

	public function switchCurrentToken():void {
		currentToken *= -1;
	}

	public function getCurrentToken():int {
		return currentToken;
	}

	// game enabled

	public function disableGame():void {
		isEnabled = false;
	}

	public function enableGame():void {
		isEnabled = true;
	}

	public function getIsEnabled():Boolean {
		return isEnabled;
	}

}
}