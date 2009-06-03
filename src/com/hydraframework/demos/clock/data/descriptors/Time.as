package com.hydraframework.demos.clock.data.descriptors {
	import com.hydraframework.demos.clock.data.interfaces.ITime;

	public class Time implements ITime {
		private var _timeCode:int = 0;

		public function Time() {
		}

		public function set timeCode(value:int):void {
			_timeCode = value;
		}
		
		public function get timeCode():int {
			return _timeCode;
		}

	}
}