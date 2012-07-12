package {
import org.mvcexpress.modularSample.MainModule;
import org.mvcexpress.modules.console.ConsoleModule;

/**
 * class to store all names of our modules.
 * Good way to organizes reusable modules in many applications,
 * properly written modules will come from many places.
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class ModuleNames {
	
	static public const MODULAR_SAMPLE_MAIN:String = MainModule.NAME;
	static public const CONSOLE_PREFIX:String = ConsoleModule.NAME_PREFIX;

}
}