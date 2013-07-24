package com.mindscriptact.mobileTestApp.model {
import com.mindscriptact.mobileTestApp.messages.DataMsg;
import mvcexpress.mvc.Proxy;

/**
 * Test proxy.
 */
public class TestProxy extends Proxy {

	// test data...
	private var testData:String = "testData"
	private var clickCount:int;

	public function TestProxy() {

	}

	//----------------------------------
	//     your functions to handle your data.
	//----------------------------------

	public function getTestData():String {
		return testData;
	}

	public function setTestData(value:String):void {
		testData = value;

		// in many cases then dada is chaned, you want to send a message so any interested mediators or commands colud react.
		sendMessage(DataMsg.TEST_DATA_CHANGED, testData);
	}

	//----------------------------------
	//     onRegister() function is tregered then proxy is registered with framework.
	//        you will want to use it instead of constructor then you have other proxies injected.
	//
	//     onRemove() is to dispose proxy then it is unregistered from framework.
	//
	//    these functions are raraly used.
	//----------------------------------

	override protected function onRegister():void {
		trace("TestProxy.onRegister");

	}

	override protected function onRemove():void {

	}

	//----------------------------------
	//     click test
	//----------------------------------

	public function countTestClicks():void {
		clickCount++;
		sendMessage(DataMsg.CLICK_COUNT_CHANGED, clickCount);
	}

}
}