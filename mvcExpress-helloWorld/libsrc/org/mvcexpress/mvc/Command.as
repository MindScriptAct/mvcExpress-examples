// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package org.mvcexpress.mvc {
import org.mvcexpress.core.CommandMap;
import org.mvcexpress.core.MediatorMap;
import org.mvcexpress.core.messenger.Messenger;
import org.mvcexpress.core.namespace.pureLegsCore;
import org.mvcexpress.core.ProxyMap;
import org.mvcexpress.core.traceObjects.MvcTraceActions;
import org.mvcexpress.core.traceObjects.TraceCommand_sendMessage;
import org.mvcexpress.core.traceObjects.TraceObj;
import org.mvcexpress.MvcExpress;

/**
 * Command, handles business logic of your application. 												</br>
 * Can send messages.
 * <b><p>
 * It MUST contain execute(params:Object) function. Parameter can be typed as you wish.
 * </p></b>
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
dynamic public class Command {
	
	/**
	 * Handles application Commands.
	 */
	public var commandMap:CommandMap;
	
	/**
	 * Handles application Mediators.
	 */
	public var mediatorMap:MediatorMap;
	
	/**
	 * Handles application Proxies.
	 */
	public var proxyMap:ProxyMap;
	
	// for comunication.
	/** @private */
	pureLegsCore var messenger:Messenger;
	
	/** @private */
	CONFIG::debug
	static pureLegsCore var canConstruct:Boolean;
	
	/** CONSTRUCTOR */
	public function Command() {
		CONFIG::debug {
			use namespace pureLegsCore;
			if (!canConstruct) {
				throw Error("Command:" + this + " can be constructed only by framework. If you want to execute it - map it to message with commandMap.map() and send a message, or execute it directly with commandMap.execute()")
			}
		}
	}
	
	/**
	 * Sends a message with optional params object.
	 * @param	type	type of the message for Commands and handle function to react to.
	 * @param	params	Object that will be passed to Command execute() function and to handle functions.
	 */
	protected function sendMessage(type:String, params:Object = null):void {
		use namespace pureLegsCore;
		// log the action
		CONFIG::debug {
			use namespace pureLegsCore;
			MvcExpress.debug(new TraceCommand_sendMessage(MvcTraceActions.COMMAND_SENDMESSAGE, messenger.moduleName, this, type, params));
		}
		//
		messenger.send(type, params);
		//
		// clean up loging the action
		CONFIG::debug {
			use namespace pureLegsCore;
			MvcExpress.debug(new TraceCommand_sendMessage(MvcTraceActions.COMMAND_SENDMESSAGE_CLEAN, messenger.moduleName, this, type, params));
		}
	}
	
	/**
	 * Sends message to all existing modules.
	 * @param	type				message type to find needed handlers
	 * @param	params				parameter object that will be sent to all handler and execute functions as single parameter.
	 */
	protected function sendMessageToAll(type:String, params:Object = null):void {
		use namespace pureLegsCore;
		messenger.sendToAll(type, params);
	}

	// execute function is not meant to be overridden in mvcExpress.
	// Because I want commands to have custom parameter object - you have to manually create execute() function in your commands.
	//public function execute(params:Object):void {
	//}

}
}