/*
 PureMVC - Copyright(c) 2006-08 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package mvcexpress.extensions.unpuremvc.unpureCore {
import flash.utils.Dictionary;

import mvcexpress.extensions.unpuremvc.patterns.facade.UnpureFacade;
import mvcexpress.extensions.unpuremvc.patterns.proxy.UnpureProxy;

/**
 * A Singleton <code>IModel</code> implementation.
 *
 * <P>
 * In PureMVC, the <code>Model</code> class provides
 * access to model objects (Proxies) by named lookup.
 *
 * <P>
 * The <code>Model</code> assumes these responsibilities:</P>
 *
 * <UL>
 * <LI>Maintain a cache of <code>IProxy</code> instances.</LI>
 * <LI>Provide methods for registering, retrieving, and removing
 * <code>IProxy</code> instances.</LI>
 * </UL>
 *
 * <P>
 * Your application must register <code>IProxy</code> instances
 * with the <code>Model</code>. Typically, you use an
 * <code>ICommand</code> to create and register <code>IProxy</code>
 * instances once the <code>Facade</code> has initialized the Core
 * actors.</p>
 *
 * @see mvcexpress.extensions.unpuremvc.patterns.proxy.UnpureProxy Proxy
 * @see mvcexpress.extensions.unpuremvc.interfaces.IProxy IProxy
 *
 * @version unpuremvc.1.0.beta2
 */
public class UnpureModel {

	// Mapping of proxyNames to IProxy instances
	protected var proxyMap:Array;

	// Singleton instance
	protected static var instanceRegistry:Dictionary = new Dictionary();

	// Message Constants
	protected const SINGLETON_MSG:String = "Model Singleton already constructed!";
	protected const MULTITON_MSG:String = "Model instance for this Multiton key already constructed!";

	//
	private var moduleName:String;
	private var facade:UnpureFacade;

	/**
	 * Constructor.
	 *
	 * <P>
	 * This <code>IModel</code> implementation is a Singleton,
	 * so you should not call the constructor
	 * directly, but instead call the static Singleton
	 * Factory method <code>Model.getInstance()</code>
	 *
	 * @throws Error Error if Singleton instance has already been constructed
	 *
	 */
	public function UnpureModel(moduleName:String = "$_SINGLECORE_$") {
		if (instanceRegistry[moduleName] != null) {
			if (moduleName == "") {
				throw Error(SINGLETON_MSG);
			} else {
				throw Error(MULTITON_MSG);
			}
		}
		this.moduleName = moduleName;
		instanceRegistry[moduleName] = this;
		facade = UnpureFacade.getInstance(moduleName);
		initializeModel();
	}

	/**
	 * Initialize the Singleton <code>Model</code> instance.
	 *
	 * <P>
	 * Called automatically by the constructor, this
	 * is your opportunity to initialize the Singleton
	 * instance in your subclass without overriding the
	 * constructor.</P>
	 *
	 * @return void
	 */
	protected function initializeModel():void {
	}

	/**
	 * <code>Model</code> Singleton Factory method.
	 *
	 * @return the Singleton instance
	 */
	public static function getInstance(moduleName:String = "$_SINGLECORE_$"):UnpureModel {
		if (instanceRegistry[moduleName] == null) {
			new UnpureModel(moduleName);
		}
		return instanceRegistry[moduleName];
	}

	/**
	 * Register an <code>IProxy</code> with the <code>Model</code>.
	 *
	 * @param proxy an <code>IProxy</code> to be held by the <code>Model</code>.
	 */
	public function registerProxy(proxy:UnpureProxy):void {
		facade.registerProxy(proxy);
	}

	/**
	 * Retrieve an <code>IProxy</code> from the <code>Model</code>.
	 *
	 * @param proxyName
	 * @return the <code>IProxy</code> instance previously registered with the given <code>proxyName</code>.
	 */
	public function retrieveProxy(proxyName:String):UnpureProxy {
		return facade.retrieveProxy(proxyName);
	}

	/**
	 * Check if a Proxy is registered
	 *
	 * @param proxyName
	 * @return whether a Proxy is currently registered with the given <code>proxyName</code>.
	 */
	public function hasProxy(proxyName:String):Boolean {
		return facade.hasProxy(proxyName);
	}

	/**
	 * Remove an <code>IProxy</code> from the <code>Model</code>.
	 *
	 * @param proxyName name of the <code>IProxy</code> instance to be removed.
	 * @return the <code>IProxy</code> that was removed from the <code>Model</code>
	 */
	public function removeProxy(proxyName:String):UnpureProxy {
		var proxy:UnpureProxy = facade.retrieveProxy(proxyName);
		facade.removeProxy(proxyName);
		return proxy;

	}

	/**
	 * Remove an IModel instance
	 *
	 * @param multitonKey of IModel instance to remove
	 */
	public static function removeModel(moduleName:String):void {
		delete instanceRegistry[moduleName];
	}

}
}