// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package mvcexpress.mvc {
import flash.utils.Dictionary;

import mvcexpress.MvcExpress;
import mvcexpress.core.ModuleManager;
import mvcexpress.core.interfaces.IProxyMap;
import mvcexpress.core.messenger.Messenger;
import mvcexpress.core.namespace.pureLegsCore;
import mvcexpress.core.traceObjects.proxy.TraceProxy_sendMessage;
import mvcexpress.core.traceObjects.proxy.TraceProxy_sendScopeMessage;

/**
 * Proxy holds and manages application data, implements API to work with it.                  </br>
 * Can send messages. (Usually sends one with each data update)                            </br>
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */

use namespace pureLegsCore;

public class Proxy {

	/**
	 * Interface to work with proxies.
	 */
	protected var proxyMap:IProxyMap;

	// Shows if proxy is ready. Read only.
	private var _isReady:Boolean; // = false;

	// used internally for communication
	/** @private */
	pureLegsCore var messenger:Messenger;

	// for sending scoped messages then injected by scope.
	private var proxyScopes:Vector.<String> = new Vector.<String>();

	// for pooled command classes that are dependant on this proxy.
	private var dependantCommands:Dictionary = new Dictionary();

	// amount of pending injections.
	/** @private */
	pureLegsCore var pendingInjections:int; // = 0;

	/** CONSTRUCTOR */
	public function Proxy() {
	}


	//----------------------------------
	//     Life cycle functions
	//----------------------------------

	/**
	 * Then proxy is mapped with proxyMap this function is called.
	 */
	protected function onRegister():void {
		// for override
	}

	/**
	 * Then proxy is unmapped with proxyMap this function is called.
	 */
	protected function onRemove():void {
		// for override
	}

	/**
	 * Indicates if proxy is ready for usage. (all dependencies are injected.)
	 */
	protected function get isReady():Boolean {
		return _isReady;
	}


	//----------------------------------
	//     MESSAGING
	//----------------------------------

	/**
	 * Sends a message with optional params object inside of current module.
	 * @param    type    type of the message for Commands or Mediator's handle function to react to.
	 * @param    params    Object that will be passed to Command execute() function or to handle functions.
	 */
	protected function sendMessage(type:String, params:Object = null):void {
		use namespace pureLegsCore;

		var moduleName:String = messenger.moduleName;
		// log the action
		CONFIG::debug {
			MvcExpress.debug(new TraceProxy_sendMessage(moduleName, this, type, params, true));
		}
		//
		messenger.send(type, params);
		//
		var scopeCount:int = proxyScopes.length;
		for (var i:int; i < scopeCount; i++) {
			ModuleManager.sendScopeMessage(moduleName, proxyScopes[i], type, params, false);
		}
		//
		// clean up logging the action
		CONFIG::debug {
			MvcExpress.debug(new TraceProxy_sendMessage(moduleName, this, type, params, false));
		}
	}

	/**
	 * Sends scoped module to module message, all modules that are listening to specified scopeName and message type will get it.
	 * @param    scopeName    both sending and receiving modules must use same scope to make module to module communication.
	 * @param    type        type of the message for Commands or Mediator's handle function to react to.
	 * @param    params        Object that will be passed to Command execute() function and to handle functions.
	 */
	protected function sendScopeMessage(scopeName:String, type:String, params:Object = null):void {
		use namespace pureLegsCore;

		var moduleName:String = messenger.moduleName;
		// log the action
		CONFIG::debug {
			MvcExpress.debug(new TraceProxy_sendScopeMessage(moduleName, this, type, params, true));
		}
		//
		ModuleManager.sendScopeMessage(moduleName, scopeName, type, params);
		//
		// clean up logging the action
		CONFIG::debug {
			MvcExpress.debug(new TraceProxy_sendScopeMessage(moduleName, this, type, params, false));
		}
	}


	//----------------------------------
	//     INTERNAL
	//----------------------------------

	/**
	 * sets proxyMap interface.
	 * @param    iProxyMap
	 * @private
	 */
	pureLegsCore function setProxyMap(iProxyMap:IProxyMap):void {
		proxyMap = iProxyMap;
	}

	/**
	 * marks mediator as ready and calls onRegister()
	 * called from proxyMap
	 * @private
	 */
	pureLegsCore function register():void {
		if (!_isReady) {
			_isReady = true;
			onRegister();
		}
	}

	/**
	 * marks mediator as not ready and calls onRemove().
	 * called from proxyMap
	 * @private
	 */
	pureLegsCore function remove():void {
		_isReady = false;
		dependantCommands = null;
		onRemove();
	}


	//----------------------------------
	//     Scoping
	//----------------------------------

	/**
	 * Add scope for proxy to send all proxy messages to.
	 * @param    scopeName
	 * @private
	 */
	pureLegsCore function addScope(scopeName:String):void {
		var messengerFound:Boolean; // = false;
		var scopeCount:int = proxyScopes.length;
		for (var i:int; i < scopeCount; i++) {
			if (proxyScopes[i] == scopeName) {
				messengerFound = true;
				break;
			}
		}
		if (!messengerFound) {
			proxyScopes[proxyScopes.length] = scopeName;
		}
	}

	/**
	 * Remove scope for proxy to send all proxy messages to.
	 * @param    scopeName
	 * @private
	 */
	pureLegsCore function removeScope(scopeName:String):void {
		var scopeCount:int = scopeName.length;
		for (var i:int; i < scopeCount; i++) {
			if (proxyScopes[i] == scopeName) {
				proxyScopes.splice(i, 1);
				break;
			}
		}
	}


	//----------------------------------
	//     Pooled commands
	//----------------------------------

	// Registers command that needs this proxy. (used for PooledCommand's only)
	/** @private */
	pureLegsCore function registerDependantCommand(signatureClass:Class):void {
		dependantCommands[signatureClass] = signatureClass;
	}

	// gets the list of dependant commands. (used to clear all PooledCommand's then proxy is removed)
	/** @private */
	pureLegsCore function getDependantCommands():Dictionary {
		return dependantCommands;
	}
}
}