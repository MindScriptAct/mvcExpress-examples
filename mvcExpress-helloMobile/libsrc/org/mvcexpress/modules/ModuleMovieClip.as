// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package org.mvcexpress.modules {
import flash.display.MovieClip;
import flash.events.Event;
import org.mvcexpress.core.CommandMap;
import org.mvcexpress.core.MediatorMap;
import org.mvcexpress.core.ModuleBase;
import org.mvcexpress.core.ModuleManager;
import org.mvcexpress.core.namespace.pureLegsCore;
import org.mvcexpress.core.ProxyMap;

/**
 * Core Module class based on MovieClip.
 * <p>
 * It starts framework and lets you set up your application. (or execute Commands for set up.)
 * You can create modular application by having more then one module.
 * </p>
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class ModuleMovieClip extends MovieClip {
	
	private var moduleBase:ModuleBase;
	
	protected var proxyMap:ProxyMap;
	protected var mediatorMap:MediatorMap;
	protected var commandMap:CommandMap;
	
	/**
	 * CONSTRUCTOR
	 * @param	moduleName	module name that is used for referencing a module. (if not provided - unique name will be generated.)
	 * @param	autoInit	if set to false framework is not initialized for this module. If you want to use framework features you will have to manually init() it first.
	 * @param	initOnStage	defines if module should init only then it is added to stage or not. By default it will wait for Event.ADDED_TO_STAGE before calling onInit(). If autoInit is set to false, this parameters is ignored.
	 */
	public function ModuleMovieClip(moduleName:String = null, autoInit:Boolean = true, initOnStage:Boolean = true) {
		use namespace pureLegsCore;
		moduleBase = ModuleManager.createModule(moduleName, autoInit);
		//
		proxyMap = moduleBase.proxyMap;
		mediatorMap = moduleBase.mediatorMap;
		commandMap = moduleBase.commandMap;
		//
		if (autoInit) {
			if (initOnStage) {
				if (this.stage) {
					onInit();
				} else {
					addEventListener(Event.ADDED_TO_STAGE, handleModuleAddedToStage, false, 0, true);
				}
			} else {
				onInit();
			}
		}
	}
	
	// inits module after it is added to stage.
	private function handleModuleAddedToStage(event:Event):void {
		removeEventListener(Event.ADDED_TO_STAGE, handleModuleAddedToStage);
		onInit();
	}
	
	/**
	 * Name of the module
	 */
	public function get moduleName():String {
		return moduleBase.moduleName;
	}
	
	/**
	 * Initializes module. If this function is not called module will not work properly.
	 * By default it is called in constructor, but you can do it manually if you set constructor parameter 'autoInit' to false.
	 */
	protected function initModule():void {
		moduleBase.initModule();
		onInit();
	}
	
	/**
	 * Function called after framework is initialized.
	 * Meant to be overridden.
	 */
	protected function onInit():void {
		// for override
	}
	
	/**
	 * Function to get rid of module.
	 * - All module commands are unmapped.
	 * - All module mediators are unmediated
	 * - All module proxies are unmapped
	 * - All internals are nulled.
	 */
	public function disposeModule():void {
		onDispose();
		moduleBase.disposeModule();
	}
	
	/**
	 * Function called before module is destroyed.
	 * Meant to be overridden.
	 */
	protected function onDispose():void {
		// for override
	}
	
	/**
	 * Message sender.
	 * @param	type	type of the message. (Commands and handle functions must bu map to it to react.)
	 * @param	params	Object that will be send to Command execute() or to handle function as parameter.
	 */
	protected function sendMessage(type:String, params:Object = null):void {
		moduleBase.sendMessage(type, params);
	}
	
	/**
	 * Sends scoped module to module message, all modules that are listening to specified scopeName and message type will get it.
	 * @param	scopeName	both sending and receiving modules must use same scope to make module to module communication.
	 * @param	type		type of the message for Commands or Mediator's handle function to react to.
	 * @param	params		Object that will be passed to Command execute() function or to handle functions.
	 */
	protected function sendScopeMessage(scopeName:String, type:String, params:Object = null):void {
		moduleBase.sendScopeMessage(scopeName, type, params);
	}
	
	//----------------------------------
	//     Debug
	//----------------------------------
	
	/**
	 * List all message mappings.
	 */
	public function listMappedMessages():String {
		return moduleBase.listMappedMessages();
	}
	
	/**
	 * List all view mappings.
	 */
	public function listMappedMediators():String {
		return moduleBase.listMappedMediators();
	}
	
	/**
	 * List all model mappings.
	 */
	public function listMappedProxies():String {
		return moduleBase.listMappedProxies();
	}
	
	/**
	 * List all controller mappings.
	 */
	public function listMappedCommands():String {
		return moduleBase.listMappedCommands();
	}

}
}