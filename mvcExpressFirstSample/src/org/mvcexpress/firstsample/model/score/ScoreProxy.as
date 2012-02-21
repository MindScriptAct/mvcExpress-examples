package org.mvcexpress.firstsample.model.score{
import org.mvcexpress.firstsample.notes.DataNote;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author 
 */
public class ScoreProxy extends Proxy {
	
	
	private var _score:int = 0;
	
	
	public function ScoreProxy() {
		
	}
	
	override protected function onRegister():void {
	
	}
	
	override protected function onRemove():void {
	
	}
	
	public function get score():int {
		return _score;
	}
	
	public function set score(value:int):void {
		_score = value;
		sendMessage(DataNote.SCORE_UPDATE, _score);
	}

}
}