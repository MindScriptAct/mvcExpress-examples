package modularProject.modularSample {
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import modularProject.global.ModuleNames;
import modularProject.modularSample.controller.setup.InitModularSampleCommand;
import modularProject.modularSample.msg.DataMessages;
import modularProject.modularSample.msg.Messages;
import modularProject.modularSample.msg.ViewMessages;

import mvcexpress.modules.ModuleCore;
import mvcexpress.utils.checkClassStringConstants;

//import com.mindscriptact.mvcExpressLogger.MvcExpressLogger;
/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class ModularSample extends Sprite {

	public var module:ModuleCore = new ModuleCore(ModuleNames.SHELL);

	public function ModularSample() {
		CONFIG::debug {
			// add mvcExpress logger for debugging. (press CTRL + ` to open it.)
			//MvcExpressLogger.init(this.stage);

			checkClassStringConstants(Messages, DataMessages, ViewMessages);
		}

		//
		this.stage.align = StageAlign.TOP_LEFT;
		this.stage.scaleMode = StageScaleMode.NO_SCALE;


		trace("ModularSampleShellModule.onInit");

		module.executeCommand(InitModularSampleCommand, this);


	}

}
}