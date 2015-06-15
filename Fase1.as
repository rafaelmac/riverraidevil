package  {
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	
	public class Fase1 extends MovieClip {
		
		var fase1mc:MovieClip = new MovieClip();

		public function Fase1() {
			// constructor code
			
			var carregaFase1:Loader = new Loader();
			carregaFase1.contentLoaderInfo.addEventListener(Event.COMPLETE, Fase1Carregado);
			carregaFase1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, Fase1Erro);
			carregaFase1.load(new URLRequest("fase1.swf"));
			
			
		}
		
		public function Fase1Carregado(e:Event):void
			{
				fase1mc = e.target.content;
				fase1mc.fase1_colisao.alpha = 0;
				addChild(fase1mc);
				
			}
		public function Fase1Erro(e:IOErrorEvent):void
			{
				trace ("erro ao adicionar a fase 1");
			}

	}
	
}
