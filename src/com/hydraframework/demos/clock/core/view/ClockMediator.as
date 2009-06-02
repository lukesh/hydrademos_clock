package com.hydraframework.demos.clock.core.view {
	import com.hydraframework.core.mvc.events.Notification;
	import com.hydraframework.core.mvc.patterns.mediator.Mediator;
	import com.hydraframework.demos.clock.core.ClockFacade;
	import com.hydraframework.demos.clock.core.data.interfaces.ITime;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.core.IUIComponent;

	public class ClockMediator extends Mediator {
		public static const NAME:String = "ClockMediator";
		
		public var time:ITime;

		public function get clock():ClockDemo {
			return this.component as ClockDemo;
		}

		public function ClockMediator(component:IUIComponent = null) {
			super(NAME, component);
		}

		override public function initialize():void {
			clock.wGetTimeButton.addEventListener(MouseEvent.CLICK, handleGetTimeClick);
			clock.wSetTimeButton.addEventListener(MouseEvent.CLICK, handleSetTimeClick);
		}
		
		override public function handleNotification(notification:Notification):void {
			super.handleNotification(notification);

			if (!notification.isResponse())
				return;

			switch (notification.name) {
				case ClockFacade.GET_TIME:
					time = ITime(notification.body);
					redraw();
					break;
			}
		}

		private function redraw():void {		
			clock.wClockDisplay.text = time.getTimeCode().toString();
		}
		
		private function handleGetTimeClick(event:Event):void {
			this.sendNotification(new Notification(ClockFacade.GET_TIME));
		}
		
		private function handleSetTimeClick(event:Event):void {
			this.sendNotification(new Notification(ClockFacade.SET_TIME, clock.wSetTimeInput.text));
		}
	}
}