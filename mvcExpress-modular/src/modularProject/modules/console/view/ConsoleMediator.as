package modularProject.modules.console.view {
import flash.events.MouseEvent;

import modularProject.modules.console.Console;
import modularProject.modules.console.msg.ConsoleDataMessages;
import modularProject.modules.console.msg.ConsoleViewMessages;

import mvcexpress.mvc.Mediator;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class ConsoleMediator extends Mediator {

	[Inject]
	public var view:Console;

	override protected function onRegister():void {
		trace("ConsoleMediator.onRegister");
		view.inputBtn.addEventListener(MouseEvent.CLICK, handleInputText);

		addHandler(ConsoleDataMessages.MESSAGE_ADDED, handleMessageAdded);
		//addRemoteHandler(GlobalMessage.SEND_INPUT_MESSAGE_TO_ALL_DONT_STORE, handleMessageAdded, ModuleNames.SHELL);

	}

	override protected function onRemove():void {
		trace("ConsoleMediator.onRemove");
	}

	private function handleInputText(event:MouseEvent):void {
		trace("Console.handleTextInput > event : " + event);
		if (view.inputTf.text) {

			sendMessage(ConsoleViewMessages.INPUT_MESSAGE, view.inputTf.text);

			view.inputTf.text = "";

		} else {
			sendMessage(ConsoleViewMessages.EMPTY_MESSAGE, "NO MESSAGE ENTERED!!.....");
		}

	}

	private function handleMessageAdded(message:String):void {
		view.outputTf.text += message + "\n";
		view.outputTf.textField.scrollV = view.outputTf.textField.maxScrollV;
	}

}
}