package helloWorld.controller.setup {
import helloWorld.model.TestProxy;

import mvcexpress.mvc.Command;

/**
 * Initial set up of maping proxies to proxy class and name for injection.
 * proxyMap.mapClass(proxyClass:Class, injectClass:Class = null, name:String = "");
 * proxyMap.mapObject(proxyObject:Proxy, injectClass:Class = null, name:String = "");
 * @author
 */
public class SetupModelCommand extends Command {

	public function execute(blank:Object):void {
		trace("SetupModelCommand.execute > blank : " + blank);

		// construct and map a proxy object for injection.
		// after this you will be able to [Inject] proxies in your commands, mediators and ather proxies.
		// We planning to allow TestProxy to be injected into Mediator, to enable it we set fourth parameter to class we will inject this proxy into mediator as.
		proxyMap.map(new TestProxy(), null, null, TestProxy);

	}

}
}