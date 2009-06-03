package com.hydraframework.demos.clock.data.delegates {
	import com.hydraframework.demos.clock.data.interfaces.ITime;
	import com.hydraframework.demos.clock.data.interfaces.ITimeDelegate;
	import com.hydraframework.demos.clock.data.descriptors.Time;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.http.mxml.HTTPService;

	public class TimeDelegate implements ITimeDelegate, IResponder {
		public function TimeDelegate() {
		}
		
		public function newTime():ITime {
			return new Time();
		}

		public function getTime():AsyncToken {
			var request:HTTPService = new HTTPService();
			request.url = "time.php";
			request.useProxy = false;
			var token:AsyncToken = request.send();
			token.addResponder(this);
			return token;
		}
		
		public function setTime(value:ITime):void {
			// Upate database
		}

		public function result(data:Object):void {
			switch(data.token.message.url) {
				case "time.php":
					var time:ITime = newTime();
					time.timeCode = data.result.data;
					data.result.data = time;
					break;
			}
		}
		
		public function fault(data:Object):void {
			trace("TimeDelegate Error url:", data.token.message.url, " error:", data);
		}
	}
}