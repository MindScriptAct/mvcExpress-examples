// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package mvcexpress.extensions.live.core {
import mvcexpress.core.MediatorMap;
import mvcexpress.core.ProxyMap;
import mvcexpress.core.messenger.Messenger;
import mvcexpress.core.namespace.pureLegsCore;
import mvcexpress.extensions.live.mvc.MediatorLive;
import mvcexpress.mvc.Mediator;

/**
 * Handles application mediators.
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */

use namespace pureLegsCore;

public class MediatorMapLive extends MediatorMap {

	// for internal use.
	private var processMap:ProcessMapLive;

	public function MediatorMapLive($moduleName:String, $messenger:Messenger, $proxyMap:ProxyMap) {
		super($moduleName, $messenger, $proxyMap);
	}

	override protected function prepareMediator(mediator:Mediator, mediatorClass:Class, viewObject:Object, injectClass:Class):Boolean {
		use namespace pureLegsCore;

		if (mediator is MediatorLive) {
			(mediator as MediatorLive).processMap = processMap;
		}
		return super.prepareMediator(mediator, mediatorClass, viewObject, injectClass);
	}


	pureLegsCore function setProcessMap(value:ProcessMapLive):void {
		processMap = value;
	}


}
}