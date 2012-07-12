// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package org.mvcexpress.messenger {
import flash.utils.Dictionary;
import org.mvcexpress.base.CommandMap;
import org.mvcexpress.MvcExpress;
import org.mvcexpress.namespace.pureLegsCore;

/**
 * Handles framework communications.
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class Messenger {
	
	// defines if messenger can be instantiated.
	static pureLegsCore var allowInstantiation:Boolean = false;
	
	// keeps ALL HandlerVO's in vectors by message type that they have to respond to.
	private var messageRegistry:Dictionary = new Dictionary(); /* of Vector.<HandlerVO> by String */
	
	// keeps ALL HandlerVO's in Dictionaries by message type, mapped by handlers for fast disabling and duplicated handler checks.
	private var handlerRegistry:Dictionary = new Dictionary(); /* of Dictionary by String */
	
	/**
	 * CONSTRUCTOR - internal class. Not available for use.
	 */
	public function Messenger() {
		use namespace pureLegsCore;
		if (!allowInstantiation) {
			throw Error("Messenger is a framework class, you can't instantiate it.");
		}
	}
	
	/**
	 * Adds handler function that will be called then message of specified type is sent.
	 * @param	type	message type to react to.
	 * @param	handler	function called on sent message, this function must have one and only one parameter.
	 * @param	handlerClassName	handler function owner class name. For debugging only.
	 * @return		returns message data object. This object can be disabled instead of removing the handle with function. (disabling is much faster)
	 */
	public function addHandler(type:String, handler:Function, handlerClassName:String = null):HandlerVO {
		// debug this action
		CONFIG::debug {
			if (MvcExpress.debugFunction != null) {
				MvcExpress.debugFunction("++ Messenger.addHandler > type : " + type + ", handler : " + handler + ", handlerClassName : " + handlerClassName);
			}
		}
		
		// if this message type used for the first time - create data placeholders.
		if (!messageRegistry[type]) {
			messageRegistry[type] = new Vector.<HandlerVO>();
			handlerRegistry[type] = new Dictionary();
		}
		
		var msgData:HandlerVO = handlerRegistry[type][handler];
		
		// check if this handler already exists for this type. (this check can be skipped in release mode.)
		CONFIG::debug {
			if (msgData) {
				throw Error("This handler function is already mapped to message type :" + type);
			}
		}
		
		// create message handler data.
		if (!msgData) {
			msgData = new HandlerVO();
			CONFIG::debug {
				msgData.handlerClassName = handlerClassName;
			}
			msgData.handler = handler;
			messageRegistry[type].push(msgData);
			handlerRegistry[type][handler] = msgData;
		}
		return msgData;
	}
	
	/**
	 * Removes handler function that will be called then message of specified type is sent.
	 * - if handler is not found it fails silently.
	 * @param	type	message type that handler had to react
	 * @param	handler	function called on sent message.
	 */
	public function removeHandler(type:String, handler:Function):void {
		// debug this action
		CONFIG::debug {
			if (MvcExpress.debugFunction != null) {
				MvcExpress.debugFunction("-- Messenger.removeHandler > type : " + type + ", handler : " + handler);
			}
		}
		
		if (handlerRegistry[type]) {
			if (handlerRegistry[type][handler]) {
				(handlerRegistry[type][handler] as HandlerVO).disabled = true;
				delete handlerRegistry[type][handler];
			}
		}
	}
	
	// TODO : consider adding error checking that will FIND this function if it fails.. (to say what mediator failed to handle the message...) debug mode only... (most likely will be slow.. but very helpful for debug mode.)
	/**
	 * Runs all handler functions associated with message type, and send params object as single parameter.
	 * @param	type				message type to find needed handlers
	 * @param	params				parameter object that will be sent to all handler functions as single parameter.
	 * @param	targetAllModules	if true, will send message to all existing modules, by default message will be internal for current module only.
	 */
	public function send(type:String, params:Object = null, targetAllModules:Boolean = false):void {
		use namespace pureLegsCore;
		// debug this action
		CONFIG::debug {
			if (MvcExpress.debugFunction != null) {
				MvcExpress.debugFunction("** Messenger.send > type : " + type + ", params : " + params);
			}
		}
		if (targetAllModules) {
			MessengerManager.sendMessageToAll(type, params);
		} else {
			var messageList:Vector.<HandlerVO> = messageRegistry[type];
			var handlerVo:HandlerVO;
			var delCount:int = 0;
			if (messageList) {
				var tempListLength:int = messageList.length
				for (var i:int = 0; i < tempListLength; i++) {
					handlerVo = messageList[i];
					// check if message is not marked to be removed. (disabled)
					if (handlerVo.disabled) {
						delCount++;
					} else {
						// if some MsgVOs marked to be removed - move all other messages to there place.
						if (delCount) {
							messageList[i - delCount] = messageList[i];
						}
						// check if handling function handles commands.
						if (handlerVo.isExecutable) {
							handlerVo.handler(type, params);
						} else {
							CONFIG::debug {
								// FOR DEBUG viewing only..
								/* Failed message type: */
								type
								/* Failed handler class: */
								handlerVo.handlerClassName
							}
							handlerVo.handler(params);
						}
					}
				}
				// remove all removed handlers.
				if (delCount) {
					messageList.splice(tempListLength - delCount, delCount);
				}
			}
		}
	}
	
	/**
	 * function to add command execute function.
	 * @private
	 */
	pureLegsCore function addCommandHandler(type:String, executeFunction:Function, handlerClass:Class = null):void {
		var executeMvgVo:HandlerVO = addHandler(type, executeFunction, String(handlerClass));
		executeMvgVo.isExecutable = true;
	}
	
	//----------------------------------
	//     Debug
	//----------------------------------
	
	/**
	 * List all message mappings.
	 * Intended to be used by ModuleCore.as
	 */
	public function listMappings(commandMap:CommandMap):String {
		use namespace pureLegsCore;
		var retVal:String = "";
		retVal = "====================== Message Mappings: ======================\n";
		var warningText:String = "WARNING: If you want to see Classes that handles messages - you must run with CONFIG::debug compile variable set to 'true'.\n";
		CONFIG::debug {
			warningText = "";
		}
		if (warningText) {
			retVal += warningText;
		}
		for (var key:String in messageRegistry) {
			var msgList:Vector.<HandlerVO> = messageRegistry[key];
			var messageHandlers:String = "";
			for (var i:int = 0; i < msgList.length; i++) {
				var handlerVo:HandlerVO = msgList[i];
				if (handlerVo.isExecutable) {
					messageHandlers += "[EXECUTES:" + commandMap.listMessageCommands(key) + "], ";
				} else {
					messageHandlers += "[" + handlerVo.handlerClassName + "], ";
				}
			}
			
			retVal += "SENDING MESSAGE:'" + key + "'\t> HANDLED BY: > " + messageHandlers + "\n";
		}
		retVal += "================================================================";
		return retVal;
	}
	
	pureLegsCore function dispose():void {
		messageRegistry = null;
		handlerRegistry = null;
	}

}
}