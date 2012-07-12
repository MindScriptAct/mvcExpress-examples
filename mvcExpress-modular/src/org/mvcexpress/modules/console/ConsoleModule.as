package org.mvcexpress.modules.console {
import com.bit101.components.PushButton;
import com.bit101.components.TextArea;
import org.mvcexpress.modules.console.controller.HandleTargetedMessageCommand;
import org.mvcexpress.modules.console.controller.HandleInputCommand;
import org.mvcexpress.modules.console.model.ConsoleLogProxy;
import org.mvcexpress.modules.console.msg.ConsoleDataMsg;
import org.mvcexpress.modules.console.msg.ConsoleMsg;
import org.mvcexpress.modules.console.msg.ConsoleViewMsg;
import org.mvcexpress.modules.console.view.ConsoleMediator;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFieldType;
import org.mvcexpress.core.ModuleSprite;
import org.mvcexpress.utils.checkClassStringConstants;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class ConsoleModule extends ModuleSprite {
	
	// name prefix used to name console module.
	static public const NAME_PREFIX:String = "console";
	
	// id of console, needed if we plan to have more then one console.
	private var consoleId:int;
	
	public var outputTf:TextArea;
	public var inputTf:TextField;
	public var inputBtn:Sprite;
	
	public function ConsoleModule(consoleId:int = 0) {
		this.consoleId = consoleId;
		// module name is provided
		super(NAME_PREFIX + this.consoleId);
	}
	
	override protected function onInit():void {
		trace("Console.onInit");
		
		// for debugging
		CONFIG::debug {
			checkClassStringConstants(ConsoleMsg, ConsoleDataMsg, ConsoleViewMsg);
		}
		
		// set up commands
		commandMap.map(ConsoleMsg.SEND_TARGETED_INPUT_MESSAGE, HandleTargetedMessageCommand);
		commandMap.map(ConsoleViewMsg.INPUT_MESSAGE, HandleInputCommand);
		commandMap.map(ConsoleMsg.SEND_INPUT_MESSAGE_TO_ALL, HandleInputCommand);
		
		// set up view
		proxyMap.map(new ConsoleLogProxy(consoleId));
		mediatorMap.map(ConsoleModule, ConsoleMediator);
		
		// start main view.
		renderConsoleView();
		mediatorMap.mediate(this);
	
	}
	
	// function to draw view elements
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
		
		// add send button
		inputBtn = new PushButton(this, inputTf.x + inputTf.width + 5, inputTf.y + 2, "send");
		inputBtn.width = 50;
	
	}
	
	// clean ub cansele an dispose.(remove all event handlers, dispose of comoplex objects.. (and simple once for consistance))
	override protected function onDispose():void {
		trace("Console.onDispose");
		outputTf = null;
		inputTf = null;
		inputBtn = null;
	}

}
}