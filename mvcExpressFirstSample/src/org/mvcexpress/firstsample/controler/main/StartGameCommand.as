package org.mvcexpress.firstsample.controler.main {
import flash.ui.Keyboard;
import org.mvcexpress.firstsample.constants.MainConfig;
import org.mvcexpress.firstsample.constants.Screens;
import org.mvcexpress.firstsample.model.hero.HeroProxy;
import org.mvcexpress.firstsample.notes.Note;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class StartGameCommand extends Command {
	
	[Inject]
	public var heroProxy:HeroProxy;
	
	public function execute(params:Object):void {
		sendMessage(Note.SHOW_SCREEN, Screens.GAME);
		
		heroProxy.heroPossition = MainConfig.STAGE_WIDTH / 2;
	}

}
}