package crm.gobelins.darkunicorn.commands
{
	import crm.gobelins.darkunicorn.models.ChangeViewVo;
	import crm.gobelins.darkunicorn.signals.ChangeViewSignal;
	import crm.gobelins.darkunicorn.views.SplashView;
	
	import org.robotlegs.mvcs.Command;
	
	public class GotoSplashCommand extends Command
	{
		[Inject]
		public var change_view_sig : ChangeViewSignal;
		
		override public function execute():void {
			var vo : ChangeViewVo = new ChangeViewVo();
			vo.viewClass = SplashView;
			change_view_sig.dispatch( vo );
		}
	}
}