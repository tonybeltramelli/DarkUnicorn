package crm.gobelins.darkunicorn.commands
{
	import crm.gobelins.darkunicorn.services.FbLoginVo;
	import crm.gobelins.darkunicorn.services.FbService;
	
	import org.robotlegs.mvcs.Command;
	
	public class FbLoginCommand extends Command
	{
		[Inject]
		public var fb_serv : FbService;
		[Inject]
		public var vo : FbLoginVo;
		
		override public function execute() : void {
			fb_serv.loginFacebook(vo);
		}
	}
}