package com.hydraframework.demos.clock.controller {
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.interfaces.IFacade;
	import com.hydraframework.core.mvc.patterns.command.SimpleCommand;
	import com.hydraframework.demos.clock.data.interfaces.ITime;
	import com.hydraframework.demos.clock.data.interfaces.ITimeDelegate;
	import com.hydraframework.demos.clock.model.ClockProxy;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;

	public class GetTimeCommand extends SimpleCommand implements IResponder {
		public function get delegate():ITimeDelegate {
			return this.facade.retrieveDelegate(ITimeDelegate) as ITimeDelegate;
		}

		public function get proxy():ClockProxy {
			return this.facade.retrieveProxy(ClockProxy.NAME) as ClockProxy;
		}

		public function GetTimeCommand(facade:IFacade) {
			super(facade);
		}

		override public function execute(notification:Notification):void {
			if (notification.isRequest()) {
				var request:AsyncToken = this.delegate.getTime();
				request.addResponder(this);
			}
		}
		
		public function result(data:Object):void {
			this.proxy.time = ITime(data.result.data);
		}
		
		public function fault(data:Object):void {
			trace("Error getting time");
		}
	}
}