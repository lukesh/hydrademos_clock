package com.hydraframework.demos.clock.core {
	import com.hydraframework.core.mvc.patterns.facade.Facade;
	import com.hydraframework.demos.clock.core.controller.*;
	import com.hydraframework.demos.clock.core.data.delegates.TimeDelegate;
	import com.hydraframework.demos.clock.core.model.ClockProxy;
	import com.hydraframework.demos.clock.core.view.ClockMediator;
	
	import mx.core.IUIComponent;

	public class ClockFacade extends Facade {
		public static const NAME:String = "ClockFacade";
		public static const GET_TIME:String = "ClockFacade.getTime";
		public static const SET_TIME:String = "ClockFacade.setTime";

		public function ClockFacade(component:IUIComponent = null) {
			super(NAME, component);
		}

		override public function registerCore():void {
			super.registerCore();
			// Delegates
			this.registerDelegate(TimeDelegate);
			// Proxies
			this.registerProxy(new ClockProxy());
			// Mediators
			this.registerMediator(new ClockMediator(this.component));
			// Commands			
			this.registerCommand(ClockFacade.GET_TIME, GetTimeCommand);
			this.registerCommand(ClockFacade.SET_TIME, SetTimeCommand);
		}
	}
}