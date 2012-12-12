package com.mindscriptact.mobileTestApp.controler.test {
import com.mindscriptact.mobileTestApp.model.TestProxy;
import org.mvcexpress.mvc.Command;
	
/**
 * TODO:CLASS COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class TestClickCommand extends Command{
	
	[Inject]
	public var testProxy:TestProxy;
	
	public function execute(blank:Object):void {
		trace( "TestClickCommand.execute > blank : " + blank );
		
		testProxy.countTestClicks();
	}
	
}
}