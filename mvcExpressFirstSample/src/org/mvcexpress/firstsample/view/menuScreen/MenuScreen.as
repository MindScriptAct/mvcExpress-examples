package org.mvcexpress.firstsample.view.menuScreen {
import com.bit101.components.Label;
import com.bit101.components.PushButton;
import flash.display.Sprite;

/**
 * COMMENT
 * @author
 */
public class MenuScreen extends Sprite {
	public var startGameBtn:PushButton;
	
	public function MenuScreen() {
		new Label(this, 50, 50, "mvcExpress sample project!")
		
		startGameBtn = new PushButton(this, 50, 90, "START GAME");
	}

}
}