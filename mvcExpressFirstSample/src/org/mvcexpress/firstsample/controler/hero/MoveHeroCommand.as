package org.mvcexpress.firstsample.controler.hero {
import org.mvcexpress.firstsample.constants.KeyCodes;
import org.mvcexpress.firstsample.constants.MainConfig;
import org.mvcexpress.firstsample.model.hero.HeroProxy;
import org.mvcexpress.mvc.Command;

/**
 * TODO:CLASS COMMENT
 * @author
 */
public class MoveHeroCommand extends Command {
	
	[Inject]
	public var heroProxy:HeroProxy;
	
	public function execute(keyCode:String):void {
		if (keyCode == KeyCodes.RIGHT) {
			if (heroProxy.heroPossition + MainConfig.HERO_STEP < MainConfig.STAGE_WIDTH - MainConfig.HERO_SIZE / 2) {
				heroProxy.heroPossition = heroProxy.heroPossition + MainConfig.HERO_STEP;
			}
		} else if (keyCode == KeyCodes.LEFT) {
			if (heroProxy.heroPossition - MainConfig.HERO_STEP > MainConfig.HERO_SIZE / 2) {
				heroProxy.heroPossition = heroProxy.heroPossition - MainConfig.HERO_STEP;
			}
		}
	}

}
}