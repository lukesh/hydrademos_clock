package com.hydraframework.demos.clock.core.data.interfaces {
	import mx.rpc.AsyncToken;
	

	public interface ITimeDelegate {
		function newTime():ITime;
		function getTime():AsyncToken;
		function setTime(value:ITime):void;
	}
}