package Inimigos{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import caurina.transitions.Tweener;
	
	public class Helicoptero extends MovieClip {

		private var carregaHelicoptero:Loader = new Loader();
		public var helicopteroMc:MovieClip = new MovieClip();
		private var helicopteroTimer:Timer;
		private var limiteEsq:Number;
		private var limiteDir:Number;
		private var tipo:Number;
		private var iniX:Number;
		private var iniY:Number;
		private var delay:Number;
		
		public function Helicoptero(_x:Number, _y:Number, _tipodeInimigo:Number, _le:Number,_ld:Number, _delay:Number) {
			// constructor code
			tipo = _tipodeInimigo;
			limiteEsq = _le;
			limiteDir = _ld;
			iniX =	_x;
			iniY =	_y;
			delay = _delay;
			helicopteroTimer =  new Timer(delay);
			carregaHelicoptero.contentLoaderInfo.addEventListener(Event.COMPLETE, HelicopteroCarregou);
			carregaHelicoptero.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, HelicopteroErro);
			switch (tipo)
			{
				case 1:
				carregaHelicoptero.load(new URLRequest("Inimigos/Inimigos/helicoptero_mc.swf"));
				break;
				case 2:
				carregaHelicoptero.load(new URLRequest("Inimigos/Inimigos/navio_mc.swf"));
				break;
				case 3:
				carregaHelicoptero.load(new URLRequest("Inimigos/Inimigos/tanque_mc.swf"));
				break;
			}
			
			
			function HelicopteroCarregou(e:Event):void
			{
				helicopteroMc = e.target.content;
				helicopteroMc.x = iniX;
				helicopteroMc.y = iniY;
				if (limiteDir == limiteEsq)
					Init("parado");
				else
			 		Init("voando");
			}
			
			function HelicopteroErro(e:IOErrorEvent):void
			{
				trace("erro");
			}
			
		}
		
		public function Init(mov:String)
		{
			addChild(helicopteroMc);
			
			if (mov != "parado")
			{
				helicopteroTimer.addEventListener(TimerEvent.TIMER, TimerH);
				helicopteroTimer.start();
			}
		}
		
		function TimerH(e:TimerEvent):void
		{
			if (helicopteroMc.x < limiteDir)
			{
				Tweener.addTween(helicopteroMc, {x:limiteDir, time:2, transition:"Linear"});
				helicopteroMc.gotoAndPlay("direita");
			}
			else
			{
				Tweener.addTween(helicopteroMc, {x:limiteEsq, time:2, transition:"Linear"});
				helicopteroMc.gotoAndPlay("esquerda");
			}
		}

	}
	
}
