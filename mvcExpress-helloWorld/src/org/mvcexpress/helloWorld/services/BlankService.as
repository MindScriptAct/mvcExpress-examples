package org.mvcexpress.helloWorld.services{
import org.mvcexpress.mvc.Proxy;

/**
 * Blank service. 
 * Service technicaly is just another proxy.
 * But conceptualy we use services to hadle remote data or other asincronous data manipulations.
 */
public class BlankService extends Proxy {
	
	public function BlankService() {
		
	}
	
	override protected function onRegister():void {
	
	}
	
	override protected function onRemove():void {
	
	}

}
}