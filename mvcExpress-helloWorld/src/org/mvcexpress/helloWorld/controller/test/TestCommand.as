package org.mvcexpress.helloWorld.controller.test {
import flash.geom.Point;
import org.mvcexpress.helloWorld.model.TestProxy;
import org.mvcexpress.mvc.Command;
	
/**
 * Test command to show execution.
 */
public class TestCommand extends Command{
	
	// Get your proxies using injection to work with your data.
	// Proxy must be mapped first to be injected.
	[Inject]
	public var testProxy:TestProxy;
	
	// function that will be executed then you send message that is maped to execute this command.
	// ...OR you can execute command dicertly with commandMap.execute(TestCommand, new Point(1, 5)); )
	// it is important to rememeber that execute() function MUST have one and only one parameter. If you dont need command to get parametrs, put "blank:Object" as parameter)
	public function execute(testData:Point):void {
		trace( "TestCommand.execute > testData : " + testData );
		
		// in command you most likely get and set your data.
		testProxy.setTestData("Command changed data!");
	}
	
}
}