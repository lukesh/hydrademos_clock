package com.hydraframework.demos.clock.model {
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.events.Phase;
	import com.hydraframework.core.mvc.patterns.proxy.Proxy;
	import com.hydraframework.demos.clock.ClockFacade;
	import com.hydraframework.demos.clock.data.interfaces.ITime;
	
	import flash.utils.setInterval;

	public class ClockProxy extends Proxy {
		public static const NAME:String = "ClockProxy";
		public var time:ITime;

		public function ClockProxy(data:Object = null) {
			super(NAME, data);
		}

		override public function initialize():void {
			super.initialize();
			setInterval(updateTime, 1000);
		}

		private function updateTime():void {
			if (time) {
				time.timeCode = time.timeCode+1;
				this.sendNotification(new Notification(ClockFacade.GET_TIME, time, Phase.RESPONSE));
			}
		}
	}
}