package com.mindscriptact.mobileTestApp.controler.setup {
import com.mindscriptact.mobileTestApp.controler.test.TestClickCommand;
import com.mindscriptact.mobileTestApp.messages.ViewMsg;

import mvcexpress.mvc.Command;

/**
 * Initial set up of maping commands to messages.
 * commandMap.map(type:String, commandClass:Class);
 * @author
 */
public class SetupControlerCommand extends Command {

	public function execute(blank:Object):void {
		trace("SetupControlerCommand.execute > blank : " + blank);

		commandMap.map(ViewMsg.TEST_CLICK, TestClickCommand);

		// map a command to message string.
		// command class will be executed then messange with that string is sent.
		//commandMap.map(Msg.TEST, TestCommand);
	}

}
}