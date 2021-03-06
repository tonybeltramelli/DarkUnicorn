package crm.gobelins.darkunicorn.views
{
	import crm.gobelins.darkunicorn.signals.FbSendScoreSignal;
	import crm.gobelins.darkunicorn.signals.GotoEndSignal;
	import crm.gobelins.darkunicorn.signals.GotoFbSignal;
	import crm.gobelins.darkunicorn.signals.GotoHomeSignal;
	
	import flash.events.MouseEvent;
	
	import mx.events.StateChangeEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class GameMediator extends Mediator
	{
		[Inject]
		public var view : GameView;
		[Inject]
		public var home_sig : GotoHomeSignal;
		[Inject]
		public var send_score_sig : FbSendScoreSignal;
		
		override public function onRegister():void{
			view.finish.add(_onFinish);
			view.addEventListener(StateChangeEvent.CURRENT_STATE_CHANGE, _onStateChanged );
			view.btn_score.addEventListener(MouseEvent.CLICK,_onScoreClicked);
		}
		
		protected function _onScoreClicked(event:MouseEvent):void
		{
			_onFinish( 1800 );
		}
		
		protected function _onStateChanged(event:StateChangeEvent):void
		{
			if( event.newState == "paused" ){
				view.removeEventListener(StateChangeEvent.CURRENT_STATE_CHANGE, _onStateChanged );
				view.btn_cancel.addEventListener(MouseEvent.CLICK, _onCancelClicked );
			}
		}
		
		protected function _onFinish( score : int ) : void {
			view.removeEventListener(StateChangeEvent.CURRENT_STATE_CHANGE, _onStateChanged );
			view.finish.remove(_onFinish);
			send_score_sig.dispatch( score );
		}
		
		protected function _onCancelClicked(event:MouseEvent):void
		{
			view.btn_cancel.removeEventListener(MouseEvent.CLICK, _onCancelClicked );
			home_sig.dispatch();
		}
	}
}