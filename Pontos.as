package  {
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	
	public class Pontos extends MovieClip {
		
		public var pontosmc:MovieClip = new MovieClip();
		public var pt:Number = 0;
		public var mt:Number = 0;

		public function Pontos() {
			// constructor code
			
			var carrega:Loader = new Loader();
			carrega.contentLoaderInfo.addEventListener(Event.COMPLETE, Carregado);
			carrega.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, Erro);
			carrega.load(new URLRequest("pontos.swf"));
		}
		
		public function Carregado(e:Event):void
			{
				pontosmc = e.target.content;
				addChild(pontosmc);
				pontosmc.pt.text = pt;
				pontosmc.mt.text = mt;
				
			}
		public function Erro(e:IOErrorEvent):void
			{
				trace ("erro ao adicionar o rodapé de pontos");
			}

	}
	
}
