package com.hydraframework.demos.clock.core.data.vos {
	import com.hydraframework.demos.clock.core.data.interfaces.ITime;

	public class Time implements ITime {
		public var timeCode:int = 0;

		public function Time() {
		}

		public function setTimeCode(value:int):void {
			timeCode = value;
		}

		public function getTimeCode():int {
			return timeCode;
		}
	}
}