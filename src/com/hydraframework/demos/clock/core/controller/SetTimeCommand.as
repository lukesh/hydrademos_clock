package com.hydraframework.demos.clock.core.controller {
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.interfaces.IFacade;
	import com.hydraframework.core.mvc.patterns.command.SimpleCommand;
	import com.hydraframework.demos.clock.core.data.interfaces.ITime;
	import com.hydraframework.demos.clock.core.data.interfaces.ITimeDelegate;
	import com.hydraframework.demos.clock.core.model.ClockProxy;

	public class SetTimeCommand extends SimpleCommand {
		public function get delegate():ITimeDelegate {
			return new (this.facade.retrieveDelegate(ITimeDelegate) as Class)();
		}

		public function get proxy():ClockProxy {
			return this.facade.retrieveProxy(ClockProxy.NAME) as ClockProxy;
		}

		public function SetTimeCommand(facade:IFacade) {
			super(facade);
		}

		override public function execute(notification:Notification):void {
			if (notification.isRequest()) {
				var time:ITime = this.delegate.newTime();
				time.setTimeCode(int(notification.body));
				this.delegate.setTime(time);
				this.proxy.time = time;
			}
		}
	}
}