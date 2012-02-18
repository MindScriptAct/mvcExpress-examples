package org.mvcexpress.firstsample.view.main {
import org.mvcexpress.firstsample.Main;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class MainMediator extends Mediator {
	
	[Inject]
	public var view:Main;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
	
	}
	
	override public function onRemove():void {
	
	}

}
}