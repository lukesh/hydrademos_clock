package com.hydraframework.demos.clock.controller {
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.interfaces.IFacade;
	import com.hydraframework.core.mvc.patterns.command.SimpleCommand;
	import com.hydraframework.demos.clock.data.interfaces.ITime;
	import com.hydraframework.demos.clock.data.interfaces.ITimeDelegate;
	import com.hydraframework.demos.clock.model.ClockProxy;

	public class SetTimeCommand extends SimpleCommand {
		public function get delegate():ITimeDelegate {
			return this.facade.retrieveDelegate(ITimeDelegate) as ITimeDelegate;
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
				time.timeCode = (int(notification.body));
				this.delegate.setTime(time);
				this.proxy.time = time;
			}
		}
	}
}