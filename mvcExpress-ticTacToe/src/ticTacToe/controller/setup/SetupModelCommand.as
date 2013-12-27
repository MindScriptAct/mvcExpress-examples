package ticTacToe.controller.setup {
import mvcexpress.mvc.Command;

import ticTacToe.model.GameBoardProxy;
import ticTacToe.model.GameProxy;

/**
 * Initial set up of maping proxies to proxy class and name for injection.
 * proxyMap.mapClass(proxyClass:Class, injectClass:Class = null, name:String = "");
 * proxyMap.mapObject(proxyObject:Proxy, injectClass:Class = null, name:String = "");
 * @author
 */
public class SetupModelCommand extends Command {

	public function execute(params:Object):void {
		proxyMap.map(new GameProxy());
		proxyMap.map(new GameBoardProxy(), null, null, GameBoardProxy);
	}

}
}