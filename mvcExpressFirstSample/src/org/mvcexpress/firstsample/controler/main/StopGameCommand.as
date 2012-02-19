package org.mvcexpress.firstsample.controler.main{
import org.mvcexpress.firstsample.constants.Screens;
import org.mvcexpress.firstsample.notes.Note;
import org.mvcexpress.mvc.Command;
	
/**
 * TODO:CLASS COMMENT
 * @author 
 */
public class StopGameCommand extends Command {
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	public function execute(params:Object):void {
		sendMessage(Note.SHOW_SCREEN, Screens.MENU);
	}
	
}
}