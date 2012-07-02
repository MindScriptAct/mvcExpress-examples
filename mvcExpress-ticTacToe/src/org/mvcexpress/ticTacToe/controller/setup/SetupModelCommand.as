package org.mvcexpress.ticTacToe.controller.setup {
import org.mvcexpress.mvc.Command;
import org.mvcexpress.ticTacToe.model.GameBoardProxy;
import org.mvcexpress.ticTacToe.model.GameProxy;

/**
 * Initial set up of maping proxies to proxy class and name for injection.
 * proxyMap.mapClass(proxyClass:Class, injectClass:Class = null, name:String = "");
 * proxyMap.mapObject(proxyObject:Proxy, injectClass:Class = null, name:String = "");
 * @author
 */
public class SetupModelCommand extends Command {
	
	public function execute(params:Object):void {
		proxyMap.map(new GameProxy());
		proxyMap.map(new GameBoardProxy());
	}

}
}