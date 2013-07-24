package com.mindScriptAct.modules.console {
import com.bit101.components.PushButton;
import com.bit101.components.TextArea;
import com.mindScriptAct.global.messages.GlobalMessage;
import com.mindScriptAct.global.ModuleNames;
import com.mindScriptAct.global.ScopeNames;
import com.mindScriptAct.modules.console.controller.HandleTargetedMessageCommand;
import com.mindScriptAct.modules.console.controller.HandleInputCommand;
import com.mindScriptAct.modules.console.model.ConsoleLogProxy;
import com.mindScriptAct.modules.console.msg.ConsoleDataMsg;
import com.mindScriptAct.modules.console.msg.ConsoleMsg;
import com.mindScriptAct.modules.console.msg.ConsoleViewMsg;
import com.mindScriptAct.modules.console.view.ConsoleMediator;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldType;
import mvcexpress.modules.ModuleSprite;
import mvcexpress.utils.checkClassStringConstants;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class Console extends ModuleSprite {

	private var consoleId:int;

	public var outputTf:TextArea;
	public var inputTf:TextField;
	public var inputBtn:Sprite;

	public function Console(consoleId:int = 0) {
		this.consoleId = consoleId;
		super(ModuleNames.CONSOLE + this.consoleId);
	}

	override protected function onInit():void {
		trace("Console.onInit");

		// for debugging
		CONFIG::debug {
			checkClassStringConstants(ConsoleMsg, ConsoleDataMsg, ConsoleViewMsg);
		}

		// set permision te receive messages to this scope. Commands use received messages to trigger.
		registerScope(ScopeNames.CONSOLE_SCOPE, false, true);

		// set up commands
		commandMap.map(ConsoleViewMsg.INPUT_MESSAGE, HandleInputCommand);
		commandMap.scopeMap(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_INPUT_MESSAGE_TO_ALL, HandleInputCommand);
		commandMap.scopeMap(ScopeNames.CONSOLE_SCOPE, GlobalMessage.SEND_TARGETED_INPUT_MESSAGE, HandleTargetedMessageCommand);

		// set up view
		proxyMap.map(new ConsoleLogProxy(consoleId));
		mediatorMap.map(Console, ConsoleMediator);

		// start main view.
		renderConsoleView();
		mediatorMap.mediate(this);

	}

	public function renderConsoleView():void {
		// add message output
		outputTf = new TextArea();
		this.addChild(outputTf);
		outputTf.text = "Console #" + consoleId + " started.\n";

		outputTf.width = 300;
		outputTf.height = 100;
		outputTf.x = 5;
		outputTf.y = 5;

		// add message input

		inputTf = new TextField();
		this.addChild(inputTf);
		inputTf.text = '';
		inputTf.border = true;
		inputTf.type = TextFieldType.INPUT;

		inputTf.width = 300;
		inputTf.height = 22;
		inputTf.x = 5;
		inputTf.y = outputTf.x + outputTf.height + 5;

		inputBtn = new PushButton(this, inputTf.x + inputTf.width + 5, inputTf.y + 2, "send");
		inputBtn.width = 50;

	}

	override protected function onDispose():void {
		trace("Console.onDispose");
	}

}
}