package org.mvcexpress.firstsample.view.keyInput{
import flash.display.Stage;
import org.mvcexpress.firstsample.notes.Note;
import org.mvcexpress.mvc.Mediator;

/**
 * TODO:CLASS COMMENT
 * @author 
 */
public class KeyboardMediator extends Mediator {
	
	[Inject]
	public var view:Stage;
	
	//[Inject]
	//public var myProxy:MyProxy;
	
	override public function onRegister():void {
		//addHandler(Note.
	}
	
	override public function onRemove():void {
		
	}
	
}
}