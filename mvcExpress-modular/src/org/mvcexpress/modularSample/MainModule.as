package org.mvcexpress.modularSample {
import org.mvcexpress.modularSample.msg.DataMsg;
import org.mvcexpress.modularSample.msg.Msg;
import org.mvcexpress.modularSample.msg.ViewMsg;
import org.mvcexpress.modularSample.view.ModularSampleMediator;
import org.mvcexpress.modules.ModuleSprite;
import org.mvcexpress.utils.checkClassStringConstants;

/**
 * Main application class(sometimes called as shell)
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */

// ModuleSprite is a class that implements ModuleCore function and extends the sprite.
// it is Main view and module in one file.
public class MainModule extends ModuleSprite {
	
	static public const NAME:String = "modularMain";
	
	public function MainModule() {
		// module name is provided
		super(NAME);
	}
	
	override protected function onInit():void {
		trace("ModularSampleShellModule.onInit");
		
		// debug
		CONFIG::debug {
			checkClassStringConstants(Msg, DataMsg, ViewMsg);
		}
		
		// set up view
		mediatorMap.map(MainModule, ModularSampleMediator);
		
		// start application.
		mediatorMap.mediate(this);
	}
	
	// usualy main module will never be disposed. 
	// but maybe at some point in future you will want to reuse it in diferent application, so it is good idea to implement it anyway.
	override protected function onDispose():void {
	
	}
}
}