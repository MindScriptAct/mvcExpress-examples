package com.mindscriptact.mobileTestApp.view.homeView {
import com.mindscriptact.mobileTestApp.messages.DataMsg;
import com.mindscriptact.mobileTestApp.messages.ViewMsg;
import flash.events.MouseEvent;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (raima156@yahoo.com)
 */
public class HomeViewMediator extends Mediator{
	
	[Inject]
	public var view:HomeView;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		trace( "HomeViewMediator.onRegister", view );
		
		view.testLabel.text = "Hello mobile!!!";
		
		
		addHandler(DataMsg.CLICK_COUNT_CHANGED, handleClickCount);
		
		addListener(view.buttonTest, MouseEvent.CLICK, handlTestClick);
	}
	
	private function handleClickCount(clickCount:int):void {
		view.testLabel.text += "\n" + clickCount + " click! ...click me again!";
	}
	
	private function handlTestClick(event:MouseEvent):void {
		sendMessage(ViewMsg.TEST_CLICK);
	}
	
	override public function onRemove():void{
		
	}
	
}
}