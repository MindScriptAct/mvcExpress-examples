package org.mvcexpress.modules.console.view {
import org.mvcexpress.modules.console.ConsoleModule;
import org.mvcexpress.modules.console.msg.ConsoleDataMsg;
import org.mvcexpress.modules.console.msg.ConsoleViewMsg;
import flash.events.MouseEvent;
import org.mvcexpress.mvc.Mediator;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class ConsoleMediator extends Mediator {
	
	[Inject]
	public var view:ConsoleModule;
	
	override public function onRegister():void {
		trace("ConsoleMediator.onRegister");
		
		view.inputBtn.addEventListener(MouseEvent.CLICK, handleInputText);
		addHandler(ConsoleDataMsg.MESSAGE_ADDED, handleMessageAdded);
	}
	
	override public function onRemove():void {
		trace( "ConsoleMediator.onRemove" );
	}
	
	private function handleInputText(event:MouseEvent):void {
		trace("Console.handleTextInput > event : " + event);
		if (view.inputTf.text) {
			
			sendMessage(ConsoleViewMsg.INPUT_MESSAGE, view.inputTf.text);
			
			view.inputTf.text = "";
			
		} else {
			sendMessage(ConsoleViewMsg.EMPTY_MESSAGE, "NO MESSAGE ENTERED!!.....");
		}
		
	}
	
	private function handleMessageAdded(message:String):void {
		view.outputTf.text += message + "\n";
		view.outputTf.textField.scrollV = view.outputTf.textField.maxScrollV; 
	}

}
}