package  {
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class Aviao extends MovieClip {
		
		public var velX:Number = 0;
		public var velY:Number = 10;
		private var acel:Number = 0;
		public var gas:Number = 0;
		public var aviaomc:MovieClip = new MovieClip();
		public var tiroLista:Array = new Array();
		public var tiroInicio:MovieClip = new MovieClip();
		
		public function Aviao() {
			// constructor code
			var carregaplane:Loader = new Loader();
			carregaplane.contentLoaderInfo.addEventListener(Event.COMPLETE, AviaoCarregado);
			carregaplane.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, AviaoErro);
			carregaplane.load(new URLRequest("aviao.swf"));
			
			this.addEventListener(Event.ENTER_FRAME, Loop);
		}
			
		function AviaoCarregado(e:Event):void
		{
			aviaomc = e.target.content;
			aviaomc.y = 540;
			aviaomc.x = 390;
			addChild (aviaomc);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, AviaoKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, AviaoKeyUp);
		}
			
		function AviaoErro(e:IOErrorEvent):void
		{
			trace("Deu erro ao inserir o avião");
		}
			
		
		public function Loop(e:Event):void
		{
			aviaomc.x += velX;
			gas--;
			for (var i:int=0; i<tiroLista.length; i++)
			{
				if (tiroLista[i].visible)
				{
					tiroLista[i].y -= 35;
					
					if (tiroLista[i].y < 0)
					{
						tiroLista[i].visible = false;
						tiroLista[i].x = -1000;
					}
				}
			}
			
		
		}
		
		public function AviaoKeyDown(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.LEFT:
					aviaomc.gotoAndPlay("esquerda");
					velX = -10;
				break;
				case Keyboard.RIGHT:
					aviaomc.gotoAndPlay("direita");
					velX = 10;
				break;
				case Keyboard.UP:
					aviaomc.gotoAndPlay("frente");
					velY = 16;
				break;
				case Keyboard.DOWN:
					velY = 7;
					aviaomc.gotoAndPlay("frente");
				break;
				case Keyboard.SPACE:
					var tiro:MovieClip = new MovieClip();
					tiro.graphics.beginFill(0xFFFFFF);
					tiro.graphics.drawRect(0, 0, 3, 5);
					tiro.graphics.endFill();
					tiro.alpha = 1;
					tiro.x = aviaomc.x + 50;
					tiro.y = aviaomc.y;
					//tiroInicio = tiro;
					addChild(tiro);
					tiroLista.push(tiro);
					
				break;
			}
		}
		public function AviaoKeyUp(e:KeyboardEvent):void
		{
			switch (e.keyCode)
			{
				case Keyboard.LEFT:
					if (velX < 0)
						velX = 0;
						aviaomc.gotoAndPlay("frente");
				break;
				case Keyboard.RIGHT:
					if (velX > 0)
						velX = 0;
						aviaomc.gotoAndPlay("frente");
				break;
				case Keyboard.UP:
				velY = 10;
				break;
				case Keyboard.DOWN:
				velY = 10;
				break;
			}
			
		}
	

	}
	
}
