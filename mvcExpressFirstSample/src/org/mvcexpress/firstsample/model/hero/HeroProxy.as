package org.mvcexpress.firstsample.model.hero {
import org.mvcexpress.firstsample.constants.MainConfig;
import org.mvcexpress.firstsample.notes.DataNote;
import org.mvcexpress.mvc.Proxy;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class HeroProxy extends Proxy {
	
	private var _heroPossition:int;
	
	public function HeroProxy() {
	
	}
	
	override protected function onRegister():void {
	}
	
	override protected function onRemove():void {
	
	}
	
	public function set heroPossition(value:int):void {
		_heroPossition = value;
		sendMessage(DataNote.HERO_POS_UPDATE, _heroPossition);
	}
	
	public function get heroPossition():int {
		return _heroPossition;
	}

}
}