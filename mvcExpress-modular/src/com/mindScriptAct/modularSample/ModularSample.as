package com.mindScriptAct.modularSample {
import com.mindScriptAct.global.ModuleNames;
import com.mindScriptAct.global.ScopeNames;
import com.mindScriptAct.modularSample.msg.DataMsg;
import com.mindScriptAct.modularSample.msg.Msg;
import com.mindScriptAct.modularSample.msg.ViewMsg;
import com.mindScriptAct.modularSample.view.ModularSampleMediator;
import com.mindscriptact.mvcExpressLogger.MvcExpressLogger;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import mvcexpress.modules.ModuleSprite;
import mvcexpress.utils.checkClassStringConstants;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class ModularSample extends ModuleSprite {

	public function ModularSample() {
		CONFIG::debug {
			// add mvcExpress logger for debugging. (press CTRL + ` to open it.)
			MvcExpressLogger.init(this.stage);

			checkClassStringConstants(Msg, DataMsg, ViewMsg);

		}

		super(ModuleNames.SHELL);
		//
		this.stage.align = StageAlign.TOP_LEFT;
		this.stage.scaleMode = StageScaleMode.NO_SCALE;

	}

	override protected function onInit():void {
		trace("ModularSampleShellModule.onInit");

		// set permision te send messages to this scope.
		registerScope(ScopeNames.CONSOLE_SCOPE, true, false);

		mediatorMap.map(ModularSample, ModularSampleMediator);

		mediatorMap.mediate(this);

	}

}
}