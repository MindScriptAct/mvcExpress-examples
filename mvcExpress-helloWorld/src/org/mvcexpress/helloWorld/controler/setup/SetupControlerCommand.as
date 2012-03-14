package org.mvcexpress.helloWorld.controler.setup{
import org.mvcexpress.helloWorld.controler.test.TestCommand;
import org.mvcexpress.helloWorld.messages.Msg;
import org.mvcexpress.mvc.Command;
	
/**
 * Initial set up of maping commands to messages.
 * commandMap.map(type:String, commandClass:Class);
 * @author 
 */
public class SetupControlerCommand extends Command {
	
	public function execute(blank:Object):void {
		trace( "SetupControlerCommand.execute > blank : " + blank );
		
		// map a command to message string.
		// command class will be executed then messange with that string is sent.
		commandMap.map(Msg.TEST, TestCommand);
	}
	
}
}